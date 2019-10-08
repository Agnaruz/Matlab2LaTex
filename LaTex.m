
classdef LaTex
% The matlab 2 latex tool
% Start by defining the class myTex = LaTex('filename')
% End the code with myTex.close() - Don't skip the step!
% ---- Tools ----
% myTex.write('\texCommand or just text')
% myTex.begin('Command') like .begin('enumerate')
% it will print out \begin{enumerate} in the file
% myTex.endin('Command')
% myTex.mathEQ(sym) creat a {equation}


% Made by Agnar Thor Bjartmarz -- Agnar17@ru.is

   properties (GetAccess = public, SetAccess = private)
      Filename = ' ';
           
   end
   properties (Access = private)
       % Saved value of the file identifier
       pFID = -1;
       fileType = '.tex';
       fileName = 'tempFile'  
       tex = '';
   end
   methods
       function obj = LaTex(fileName)
          % Creat a file with 'yourfileName' no .tex needed
          obj.Filename = [fileName obj.fileType];
          if(obj.pFID <0)
              [obj.pFID, err] = fopen(obj.Filename, 'w+');               
              if ~isempty(err)
                  error(message('dsp:FileReader:fileError',err));
              end
          end  
       end
       function begin(obj,tex)
           % This is \begin{task}
          fprintf(obj.pFID,'\\begin{%s}\n',tex); 
       end
       function endin(obj,tex)
           % This is \end{task}
          fprintf(obj.pFID,'\\end{%s}\n',tex); 
       end
       function write(obj,tex)
          % Print to file a command or text
          if(tex(1) == '\')
              fprintf(obj.pFID,'\\%s\n',tex(2:end));
          else
            fprintf(obj.pFID,'%s\n',tex);
          end
       end
       function mathEQ(obj,func)
           fprintf(obj.pFID,'\\begin{equation}\n');
           fprintf(obj.pFID,'\t %s \n',latex(func));
           fprintf(obj.pFID,'\\end{equation}\n');
           
           
       end
       
       function close(obj)
           % USE THIS TO CLOSE THE FILE AT THE END OF CODE!
           fclose(obj.pFID);
       end
   end
   

end

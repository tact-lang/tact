struct Once {
   flag: Bool;
   data: String;
}

contract OptFlds {
   opt1: Once?;
   opt2: Once?;

   init() {
       self.opt1 = null;
       self.opt2 = null;
   }
}
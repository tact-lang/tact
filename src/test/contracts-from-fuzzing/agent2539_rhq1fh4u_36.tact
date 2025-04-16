struct HasStrings {
  s: String;
}

contract StringsAndStructs {
   s1: String;
   s2: HasStrings;

   init() {
     self.s1 = "y";
     self.s2 = HasStrings{s:"z"};
   }
}
struct OptStr {
 a: String?;
 b: String?;
}

contract OnlyOptionalStrings {
 val: OptStr;

 init() {
   self.val = OptStr{a:null,b:null};
 }
}
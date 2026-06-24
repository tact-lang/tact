struct StringStruct {
 s: String;
}

contract OptString {
 s1: StringStruct?;
 s2: StringStruct?;

 init() {
  self.s1 = null;
  self.s2 = null;
 }
}
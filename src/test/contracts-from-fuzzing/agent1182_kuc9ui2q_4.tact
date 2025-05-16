struct S {
  int1: Int;
  bool1: Bool;
  str1: String;
  opt1: Int?;
  int2: Int;
  bool2: Bool;
  str2: String;
  opt2: Int?;
  int3: Int;
  bool3: Bool;
  str3: String;
  opt3: Int?;
}

contract LargeStructHolder {
  big: S;
  init() {
    self.big = S{
      int1:1, bool1:true, str1:"a", opt1:null,
      int2:2, bool2:false, str2:"b", opt2:5,
      int3:3, bool3:true, str3:"c", opt3:null
    };
  }
}

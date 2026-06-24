struct DefaultsStruct {
  a: Int = 1;
  b: Int?;
  c: Int = 2;
}

contract MixDefaultOptional {
  s: DefaultsStruct = DefaultsStruct{ a:3, b:null, c:4 };
}
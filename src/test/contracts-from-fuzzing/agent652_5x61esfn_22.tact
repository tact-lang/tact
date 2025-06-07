struct Inner {
  a: Int = 1;
  b: Bool = true;
}

struct BigStruct {
  f1: Int = 1;
  f2: Int = 2;
  f3: Int = 3;
  f4: Int = 4;
  f5: Int = 5;
  f6: Int = 6;
  f7: Bool = false;
  f8: Bool = true;
  optInner: Inner?;
}

contract BigNestedStructStorage {
  data: BigStruct = BigStruct{};
}
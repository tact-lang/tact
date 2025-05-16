struct Nested {
  inner: InnerStruct;
}

struct InnerStruct {
  x: Int = 3;
  flag: Bool = true;
}

contract DeepNested {
    data: Nested = Nested{ inner: InnerStruct{} };
}
struct AllOptional {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract AllNulls {
  state: AllOptional = AllOptional{
    a: null,
    b: null,
    c: null
  };

  init() {}
}

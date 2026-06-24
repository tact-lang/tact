// struct with optional
struct OptInner {
  foo: Int?;
}

// struct with optional of previous struct
struct OptWrap {
  wrap: OptInner?;
}

contract Test {
  opt: OptWrap = OptWrap{ wrap: null };
}
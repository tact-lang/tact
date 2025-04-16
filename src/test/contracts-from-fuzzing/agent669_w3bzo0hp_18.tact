// Struct with optional nested inside other optional (NESTING OPTIONALS IS KNOWN UNSUPPORTED, SKIPPED)
// Instead test optional field inside optional struct
struct InnerO {
  foo: Int?;
}

struct OuterO {
  inner: InnerO?;
}

contract OptInOpt {
  data: OuterO;

  init() {
    self.data = OuterO{
      inner: null
    };
  }
}

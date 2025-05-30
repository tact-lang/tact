// Optional struct default initialized (should be null)
struct DefaultOptStruct {
  x: Int;
}

contract OptStructImplicitNull {
  s: DefaultOptStruct?;

  init() {
    // no explicit assignment, should be null by default
  }
}

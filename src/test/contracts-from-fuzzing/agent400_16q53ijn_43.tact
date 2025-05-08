// Struct with optional inner struct with no default
struct InnerS {
  val: Int;
}

struct OuterS {
  maybeInner: InnerS?;
}

contract OptStructNoDefault {
  s: OuterS = OuterS { maybeInner: null };
  init() {}
}
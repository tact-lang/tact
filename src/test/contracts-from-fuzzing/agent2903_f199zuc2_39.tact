struct Inner {
  nestedVal: Int?;
}

struct Outer {
  optInner: Inner?;
  val: Int;
}

struct Big {
  bigVal: Int;
  flag: Bool;
  outer: Outer?;
}

contract Combo {
  field: Big = Big{
    bigVal: 5,
    flag: true,
    outer: null
  };
}
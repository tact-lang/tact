message(42) Msg { num: Int; }

struct S {
  inside: Msg;
}

contract OptStructReqMsg {
  maybe: S? = null;
}
message(42) Msg {
  foo: Int;
}

struct Outer {
  innerOpt: Msg?;
}

contract NestedOptMsgStorage {
  val: Outer = Outer{innerOpt: null};
}
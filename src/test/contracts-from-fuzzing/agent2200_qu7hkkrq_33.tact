message(42) Msg {
  foo: Int;
}

struct Container {
  m: Msg;
}

contract NestedMsgStorage {
  c: Container = Container{m: Msg{foo: 7}};
}
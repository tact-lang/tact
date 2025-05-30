message(1) EmptyMsg {}

message(2) WrapM { inner: EmptyMsg; }

contract NestedEmptyMsg {
    m: WrapM = WrapM{ inner: EmptyMsg{} };
}
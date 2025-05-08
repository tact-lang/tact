message SameField1 {
    x: Int;
}

message SameField2 {
    x: Int;
}

contract TestContract {
    receive(msg: SameField1) {}
    receive(msg: SameField2) {}
}
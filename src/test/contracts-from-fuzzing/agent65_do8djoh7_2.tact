message MyMessage { val: Int; }

contract Test {
    receive(_: MyMessage) {}
}

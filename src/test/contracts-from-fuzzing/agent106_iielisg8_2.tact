message TestMsg { val: Int }

contract TestA {
    // Valid usage: discard receiver parameter using wildcard in a message receiver
    receive(_: TestMsg) {}
}

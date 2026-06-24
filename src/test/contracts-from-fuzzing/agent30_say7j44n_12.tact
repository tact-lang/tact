message(0x11111111) TestMsg {}

contract Test {
    init() {}
    receive(_: TestMsg) {
        // do nothing
    }
}
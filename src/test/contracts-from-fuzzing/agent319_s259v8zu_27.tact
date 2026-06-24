message(1) FooMsg { val: Int }

contract TestContract {
    msgVal: FooMsg;

    init() {
        self.msgVal = FooMsg{val: 42};
    }
}
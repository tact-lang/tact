message(0xabc) MyMsg { foo: Int }

contract TestContract {
    stored: MyMsg?;

    init() {
        self.stored = null;
    }

    receive() {}
}
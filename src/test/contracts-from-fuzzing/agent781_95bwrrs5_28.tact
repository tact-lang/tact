message(0x55) X { foo: Int; }

contract TestContract {
    opt: X?;

    init() {
        self.opt = null;
    }
}
message(0x777) EmptyMsg {}

contract TestContract {
    opt: EmptyMsg?;

    init() {
        self.opt = null;
    }
}
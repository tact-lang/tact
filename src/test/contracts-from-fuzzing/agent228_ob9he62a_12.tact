message(88) EmptyMsg {}

contract TestContract {
    opt: EmptyMsg?;

    init() {
        self.opt = null;
    }
}
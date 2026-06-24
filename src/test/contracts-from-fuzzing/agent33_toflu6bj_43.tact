message(42) EmptyMsg {}

contract TestContract {
    emptyOpt: EmptyMsg?;

    init() {
        self.emptyOpt = null;
    }
}
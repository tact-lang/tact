message(1234) EmptyMsg {}

contract TestContract {
    em: EmptyMsg?;

    init() {
        self.em = null;
    }
}
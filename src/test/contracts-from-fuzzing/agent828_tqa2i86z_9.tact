message(0xDEADBEEF) EmptyAgain {}

contract TestContract {
    maybe: EmptyAgain?;

    init() {
        self.maybe = EmptyAgain{};
    }
}
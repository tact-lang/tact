struct Wrapped {
    number: Int;
}

contract TestContract {
    optWrapped: Wrapped?;

    init() {
        self.optWrapped = null;
    }

    receive() {
        let _ = self.optWrapped;
    }
}
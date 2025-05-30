struct Container {
    num: Int;
}

contract TestContract {
    optionalField: Container?;

    init() {
        self.optionalField = null;
    }

    receive() {
        self.optionalField = Container{ num: 42 };
    }
}
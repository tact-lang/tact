struct Example {
    x: Int;
}

contract TestContract {
    e: Example;

    init() {
        self.e = Example{x: 123};
    }
}
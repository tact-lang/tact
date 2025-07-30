struct Demo {
    one: Int;
    two: Int;
}

contract TestContract {
    d: Demo;

    init() {
        self.d = Demo{
            one: 1,
            two: 2,
        };
    }
}

message(42) Something {
    foo: Int;
    bar: String;
}

contract TestContract {
    stored: Something;

    init() {
        self.stored = Something{
            foo: 7,
            bar: "hi"
        };
    }
}
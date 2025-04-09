struct WithDefaults {
    foo: Int = 1;
    bar: String = "bar";
}

contract OptWithDefaults {
    val: WithDefaults?;

    init() {
        self.val = null;
    }

    receive() {}
}

struct WithDefaults {
    a: Int = 42;
    b: Bool;
    c: String = "hello";
}

contract DefaultsTest {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{ b:true };
    }
}
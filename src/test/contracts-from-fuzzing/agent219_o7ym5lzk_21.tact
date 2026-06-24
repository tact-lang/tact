struct ABool {
    a: Int;
    b: Bool;
}

contract DefaultsTest {
    x: Int = 77;
    y: Bool = true;
    ab: ABool;

    init() {
        self.ab = ABool{
            a: 123,
            b: false
        };
    }
}
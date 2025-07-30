struct DefaultAndOptional {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
}

contract MixedDefaultOptionalTest {
    s: DefaultAndOptional;

    init() {
        self.s = DefaultAndOptional{ b: null };
    }
}
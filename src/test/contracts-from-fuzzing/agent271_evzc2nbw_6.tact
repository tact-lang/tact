struct DefaultsAndOptionals {
    a: Int = 7;
    b: Bool?;
    c: String = "hi";
}

contract DefaultsOptionalTest {
    s: DefaultsAndOptionals;

    init() {
        self.s = DefaultsAndOptionals{ b: null };
    }
}

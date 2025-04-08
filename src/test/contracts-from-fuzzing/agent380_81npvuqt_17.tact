struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?; // should be null
}

contract DefaultsFieldsTest {
    data: Defaults;

    init() {
        self.data = Defaults{
            d: null
        };
    }
}
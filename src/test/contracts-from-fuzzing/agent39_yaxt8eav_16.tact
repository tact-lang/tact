struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract DefaultsTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{
            d: null,
            e: null,
        };
    }
}
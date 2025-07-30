struct DefaultsTest {
    a: Int = 10;
    b: Bool = false;
    c: String = "abc";
    d: Int?;
    e: Bool?;
}

contract DefaultsInStorage {
    data: DefaultsTest;

    init() {
        self.data = DefaultsTest{
            d: null,
            e: true,
        };
    }
}
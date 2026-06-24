struct DefaultsTest {
    a: Int = 10;
    b: Bool = true;
    c: String = "init";
    d: Int?; // null by default
}

contract DefaultsInStruct {
    st: DefaultsTest;
    
    init() {
        self.st = DefaultsTest{
            d: null,
        };
    }
}
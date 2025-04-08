struct DefaultsStruct {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "hello";
}

contract DefaultsTest {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{
            a: 42,
            b: false,
            c: myAddress(),
            d: "world"
        };
    }
}

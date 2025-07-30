// test default values inside nested structs in contract storage
struct DefaultsInStruct {
    a: Int = 10;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract NestedWithDefaults {
    inner: DefaultsInStruct;

    init() {
        self.inner = DefaultsInStruct{
            d: myAddress(),
        };
    }
}

struct DefaultsTest {
    foo: Int = 42;
    bar: Bool = true;
    addr: Address;
}

contract DefaultsInStruct {
    val: DefaultsTest;
    init() {
        self.val = DefaultsTest{
            addr: myAddress()
        };
    }
}
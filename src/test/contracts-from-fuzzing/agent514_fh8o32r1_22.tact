struct SerialTest {
    a: Int as uint8;
    b: Int as int32;
    c: Bool;
    d: String;
    e: Address;
}

contract SerialContract {
    data: SerialTest;
    init() {
        self.data = SerialTest{
            a:255,
            b:-123456,
            c:true,
            d:"abc",
            e:myAddress()
        };
    }
}
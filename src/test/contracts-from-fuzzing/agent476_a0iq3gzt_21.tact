struct OptionalInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract OptStructTest {
    data: OptionalInStruct;

    init() {
        self.data = OptionalInStruct{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}

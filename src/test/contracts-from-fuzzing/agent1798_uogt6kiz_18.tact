struct OptionalInStruct {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
}

contract NestedOptionalTest {
    data: OptionalInStruct;
    init() {
        self.data = OptionalInStruct{
            a:null, b:null, c:null, d:null,
        };
    }
}
struct InnerStruct {
    a: Int;
    b: Bool;
    c: Address?;
    d: String;
}

contract NestedStructTest {
    val: InnerStruct;
    
    init() {
        self.val = InnerStruct{
            a: 10,
            b: true,
            c: null,
            d: "hey"
        };
    }
}
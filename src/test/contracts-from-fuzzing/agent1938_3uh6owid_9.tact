struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
}

contract CombinedStructTest {
    storage: InnerStruct;

    init() {
        self.storage = InnerStruct{
            a:5, b:true, c:"hi", d:emptyCell().asSlice(), e:myAddress()
        };
    }
}
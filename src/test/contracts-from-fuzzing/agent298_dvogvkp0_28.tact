struct NestSliceMsg {
    slice: Slice;
    str: String;
}

struct OuterWrap {
    nested: NestSliceMsg;
    address: Address;
}

contract NestedReference {
    payload: OuterWrap;
    init() {
        self.payload = OuterWrap{
            nested: NestSliceMsg{ slice: emptyCell().asSlice(), str: "ok" },
            address: myAddress()
        };
    }
}
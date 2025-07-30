struct Nested123 {
    int1: Int as int1;
    int8: Int as int8;
    int64: Int as int64;
    int257: Int as int257;
    text: String;
    flag: Bool;
    data: Cell;
    slice: Slice;
    addr: Address;
    nested: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract WideContract {
    store: Nested123;

    init() {
        self.store = Nested123{
            int1: 1, int8: 8, int64: 64, int257: 257,
            text: "hello", flag: true, data: emptyCell(), slice: emptyCell().asSlice(), addr: myAddress(),
            nested: InnerStruct{ x: 10, y: null }
        };
    }
}

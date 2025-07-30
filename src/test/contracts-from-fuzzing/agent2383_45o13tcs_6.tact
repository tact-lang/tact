struct Inner {
    flag: Bool;
}

struct WithList {
    f1: Int;
    f2: String;
    f3: Cell;
    f4: Address;
    f5: Slice;
    f6: Int?;
    f7: Bool?;
    f8: String;
    f9: Address;
    f10: Slice;
    inner: Inner;
}

contract ManyFields {
    storage: WithList;
    init() {
        self.storage = WithList{
            f1: 1, f2: "hi", f3: emptyCell(), f4: myAddress(), f5: emptyCell().asSlice(),
            f6: null, f7: true, f8: "bye", f9: myAddress(), f10: emptyCell().asSlice(),
            inner: Inner{ flag: false }
        };
    }
}
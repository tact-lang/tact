struct ManyNestedFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Bool?;
    f7: String?;
    f8: Address?;
}

struct Holder {
    inner1: ManyNestedFields;
    inner2: ManyNestedFields;
}

contract DoubleNestedFields {
    h: Holder;
    init() {
        self.h = Holder{
            inner1: ManyNestedFields{
                f1: 1, f2: true, f3: "foo", f4: emptyCell().asSlice(), f5: myAddress(), f6: null, f7: null, f8: null
            },
            inner2: ManyNestedFields{
                f1: 2, f2: false, f3: "bar", f4: emptyCell().asSlice(), f5: myAddress(), f6: true, f7: "yes", f8: myAddress()
            }
        };
    }
}
struct R {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: Bool;
    f5: Bool?;
    f6: Address;
    f7: String?;
    f8: Cell;
    f9: Cell?;
    f10: Slice;
    f11: Slice?;
    f12: Builder;
    f13: Builder?;

    nested: InlineDefault;
}

struct InlineDefault {
    a: Int = 0;
    b: Bool = true;
    c: String = "hello";
}

contract NestedWide {
    payload: R;

    init() {
        self.payload = R{
            f1: 1,
            f2: null,
            f3: "abc",
            f4: false,
            f5: true,
            f6: myAddress(),
            f7: null,
            f8: emptyCell(),
            f9: null,
            f10: emptyCell().asSlice(),
            f11: null,
            f12: beginCell(),
            f13: null,
            nested: InlineDefault{}
        };
    }
}
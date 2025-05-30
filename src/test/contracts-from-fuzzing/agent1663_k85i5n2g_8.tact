struct A {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
}

struct B {
    inner: A;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract NestedLarge {
    state: B;
    init() {
        self.state = B{
            inner: A{
                f1:1,
                f2:null,
                f3:"x",
                f4:emptyCell(),
                f5:emptyCell().asSlice(),
                f6:myAddress(),
                f7:null,
                f8:true,
                f9:null,
                f10:null,
                f11:null,
                f12:null
            },
            f13:42,
            f14:false,
            f15:"abc"
        };
    }
}
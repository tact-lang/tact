struct A {
    aa: Int;
    ab: Bool;
}

struct B {
    ba: String;
    bb: Address;
    bc: Cell;
}

struct C {
    ca: Slice;
    cb: Int?;
    cc: Bool?;
}

contract NestedMultiStruct {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{ aa: 1, ab: true };
        self.f2 = B{ ba: "hi", bb: myAddress(), bc: emptyCell() };
        self.f3 = C{ ca: emptyCell().asSlice(), cb: null, cc: false };
    }
}
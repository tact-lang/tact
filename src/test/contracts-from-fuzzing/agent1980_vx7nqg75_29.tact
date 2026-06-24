struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
}

contract MultipleFlatFields {
    f1: Flat;
    f2: Flat;
    f3: Flat;

    init() {
        self.f1 = Flat{a: 1, b:true, c:"A", d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:myAddress()};
        self.f2 = Flat{a: 2, b:false, c:"B", d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:myAddress()};
        self.f3 = Flat{a: 3, b:true, c:"C", d:emptyCell(), e:emptyCell().asSlice(), f:beginCell(), g:myAddress()};
    }
}
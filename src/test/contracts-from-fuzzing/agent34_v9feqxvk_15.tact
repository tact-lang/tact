struct A {
    v1: Int;
    v2: Bool;
    v3: Address;
}

struct B {
    a: A;
    optStr: String?;
    flag: Bool;
}

struct C {
    b: B;
    cellVal: Cell;
    sliceVal: Slice;
}

contract LayeredComplex {
    storage: C;

    init() {
        self.storage = C{
            b: B{
                a: A{ v1:1, v2:true, v3:myAddress() },
                optStr: null,
                flag: false
            },
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}
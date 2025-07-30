struct A {
    aa: Int;
    ab: String;
    ac: Bool;
}

struct B {
    ba: Int;
    bb: Cell;
    bc: Slice;
}

struct C {
    ca: A;
    cb: B;
    cc: Address;
    cd: String?;
}

contract DeepComposition {
    comp: C;
    init() {
        self.comp = C{
            ca: A{aa:1, ab:"x", ac:true},
            cb: B{ba:2, bb:emptyCell(), bc:emptyCell().asSlice()},
            cc: myAddress(),
            cd: null
        };
    }
}
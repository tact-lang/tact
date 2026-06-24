struct Rec {
    val: Int;
}

struct Container {
    r1: Rec;
    r2: Rec;
    r3: Rec;
    r4: Rec;
    r5: Rec;
}

contract WideStruct {
    cont: Container;

    init() {
        self.cont = Container{
            r1: Rec{val:1},
            r2: Rec{val:2},
            r3: Rec{val:3},
            r4: Rec{val:4},
            r5: Rec{val:5}
        };
    }
}
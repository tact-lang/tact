struct Rec1 {
    a: Int?;
    b: Int?;
}

struct Rec2 {
    c: Int?;
    d: Int?;
}

struct Container {
    r1: Rec1;
    r2: Rec2;
}

contract RecContainer {
    val: Container;

    init() {
        self.val = Container{
            r1: Rec1{a: null, b: null},
            r2: Rec2{c: null, d: null},
        };
    }
}
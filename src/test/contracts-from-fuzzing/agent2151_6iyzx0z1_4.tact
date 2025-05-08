struct A { x: Int; }
struct B { y: Int?; }
struct C { z: Int; }

struct LargeStruct {
    a: A;
    b: B;
    c: C;
    extra1: Int;
    extra2: Int?;
    extra3: Int;
    extra4: Int?;
}

contract BigFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: A{x: 1},
            b: B{y: null},
            c: C{z: 3},
            extra1: 4,
            extra2: null,
            extra3: 6,
            extra4: null
        };
    }
}
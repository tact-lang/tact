struct Compose1 { 
    a: Int;
    b: Bool;
}
struct Compose2 { 
    x: Int;
    y: Compose1;
}
struct Compose3 {
    z: Slice;
    nested: Compose2;
}

contract TestContract {
    c3: Compose3;
    f: Bool;

    init() {
        self.c3 = Compose3{
            z: emptyCell().asSlice(),
            nested: Compose2{
                x: 5,
                y: Compose1{
                    a: 1,
                    b: false,
                }
            },
        };
        self.f = true;
    }
}
struct Inner1 {
    a: Int;
    b: Bool;
}

struct Inner2 {
    c: String;
    d: Slice;
}

struct Outer {
    x: Inner1;
    y: Inner2;
    z: Int?;
}

contract MultiNested {
    d: Outer;
    init() {
        self.d = Outer{
            x: Inner1{
                a: 1,
                b: true
            },
            y: Inner2{
                c: "hi",
                d: emptyCell().asSlice()
            },
            z: 42
        };
    }
}
struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Rec1;
    c: Int;
}

struct Rec3 {
    d: Rec2;
    e: String;
}

contract TestContract {
    r: Rec3;

    init() {
        self.r = Rec3{
            d: Rec2{
                b: Rec1{ a: 42 },
                c: 21,
            },
            e: "x"
        };
    }

    receive() {}
}
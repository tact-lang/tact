struct Rec1 {
    a: Int;
}

struct Rec2 {
    b: Bool;
    x: Rec1;
}

struct Rec3 {
    c: String;
    y: Rec2;
}

contract NestedRecords {
    r: Rec3;

    init() {
        self.r = Rec3{
            c: "val",
            y: Rec2{
                b: true,
                x: Rec1{ a: 77 }
            }
        };
    }
}
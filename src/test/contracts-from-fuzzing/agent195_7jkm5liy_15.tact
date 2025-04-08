struct Rec1 {
    a: Int;
    b: String;
}

struct Rec2 {
    rec: Rec1;
    val: Int;
}

struct Rec3 {
    first: Rec1;
    second: Rec2;
}

contract MultiRecord {
    data: Rec3;

    init() {
        self.data = Rec3{
            first: Rec1{ a: 1, b: "x" },
            second: Rec2{ rec: Rec1{ a: 2, b: "y" }, val: 99 }
        };
    }
}

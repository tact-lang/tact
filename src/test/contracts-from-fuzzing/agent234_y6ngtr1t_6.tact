struct Rec1 {
    a: Int;
}

struct Rec2 {
    x: Rec1;
    y: Bool;
}

struct Rec3 {
    k: String;
    m: Rec2;
    n: Int;
}

contract DeepRecursion {
    data: Rec3;

    init() {
        self.data = Rec3{
            k:"hi",
            m: Rec2{ x: Rec1{a:1}, y:true },
            n: 42
        };
    }
}
struct Rec1 {
    x: Int;
}

struct Rec2 {
    a: Rec1;
    b: Int;
}

struct Rec3 {
    inner: Rec2;
    other: Bool;
}

contract TestContract {
    data: Rec3;

    init() {
        self.data = Rec3{
            inner: Rec2{
                a: Rec1{ x: 5 },
                b: 10
            },
            other: true
        };
    }
}
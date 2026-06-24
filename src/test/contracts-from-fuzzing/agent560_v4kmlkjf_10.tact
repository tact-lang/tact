struct Rec1 {
    a: Int;
    b: Int?;
    c: Rec2;
}

struct Rec2 {
    x: Int?;
    y: Rec3;
}

struct Rec3 {
    m: Int;
    n: Bool?;
}

contract RecursionTest {
    val: Rec1;

    init() {
        self.val = Rec1{
            a: 42,
            b: null,
            c: Rec2{
                x: null,
                y: Rec3{
                    m: 7,
                    n: true
                }
            }
        };
    }
}
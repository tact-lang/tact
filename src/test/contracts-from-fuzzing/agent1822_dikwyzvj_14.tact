struct Rec1 {
    inner: Rec2;
}

struct Rec2 {
    inner: Rec3;
}

struct Rec3 {
    val: Int;
}

contract RecursionTest {
    rec: Rec1;

    init() {
        self.rec = Rec1{
            inner: Rec2{
                inner: Rec3{
                    val: 123,
                },
            },
        };
    }
}
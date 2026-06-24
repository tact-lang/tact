struct Rec1 {
    inner: Rec2;
}

struct Rec2 {
    inner: Rec3;
}

struct Rec3 {
    val: Int;
}

contract RecContract {
    data: Rec1;

    init() {
        self.data = Rec1{
            inner: Rec2{
                inner: Rec3{
                    val: 99
                }
            }
        };
    }
}
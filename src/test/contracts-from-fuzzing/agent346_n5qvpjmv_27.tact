struct Rec1 {
    inner: Rec2;
}

struct Rec2 {
    inner: Rec3;
}

struct Rec3 {
    inner: Rec4;
}

struct Rec4 {
    val: Int;
}

contract DeepRecursive {
    s: Rec1;

    init() {
        self.s = Rec1{
            inner: Rec2{
                inner: Rec3{
                    inner: Rec4{
                        val: 42
                    }
                }
            }
        };
    }
}
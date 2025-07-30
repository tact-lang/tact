struct Rec1 {
    num: Int;
}

struct Rec2 {
    inner: Rec1;
}

struct Rec3 {
    inner: Rec2;
}

struct Rec4 {
    inner: Rec3;
}

contract DeepRecursion {
    storage: Rec4;

    init() {
        self.storage = Rec4{
            inner: Rec3{
                inner: Rec2{
                    inner: Rec1{
                        num: 44
                    }
                }
            }
        };
    }
}
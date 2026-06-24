struct Rec1 { inner: Rec2; }
struct Rec2 { inner: Rec3; }
struct Rec3 { inner: Rec4; }
struct Rec4 { leaf: Int; }

contract Test {
    root: Rec1;

    init() {
        self.root = Rec1{
            inner: Rec2{
                inner: Rec3{
                    inner: Rec4{
                        leaf: 42
                    }
                }
            }
        };
    }
}
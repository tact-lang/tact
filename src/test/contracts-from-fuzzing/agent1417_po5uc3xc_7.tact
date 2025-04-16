struct MegaNester1 {
    inner: MegaNester2;
}
struct MegaNester2 {
    inner: MegaNester3;
}
struct MegaNester3 {
    inner: MegaNester4;
}
struct MegaNester4 {
    inner: MegaNester5;
}
struct MegaNester5 {
    inner: MegaNester6;
}
struct MegaNester6 {
    inner: MegaNester7;
}
struct MegaNester7 {
    value: Int;
}

contract DeepMega {
    state: MegaNester1;
    init() {
        self.state = MegaNester1{
            inner: MegaNester2{
                inner: MegaNester3{
                    inner: MegaNester4{
                        inner: MegaNester5{
                            inner: MegaNester6{
                                inner: MegaNester7{
                                    value: 42
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
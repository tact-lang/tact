struct VeryDeep {
    d: Int;
}

struct Depth4 {
    inner: VeryDeep;
}

struct Depth3 {
    inner: Depth4;
}

struct Depth2 {
    inner: Depth3;
}

struct Depth1 {
    inner: Depth2;
}

contract DepthContract {
    data: Depth1;
    init() {
        self.data = Depth1{
            inner: Depth2{
                inner: Depth3{
                    inner: Depth4{
                        inner: VeryDeep{
                            d: 99,
                        }
                    }
                }
            }
        };
    }
}

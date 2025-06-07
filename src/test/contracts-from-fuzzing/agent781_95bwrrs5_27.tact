message(1) InnerMost {
    val: Int;
}

message(2) Middle {
    inner: InnerMost;
}

struct Container {
    m: Middle;
}

contract TestContract {
    f: Container;

    init() {
        self.f = Container {
            m: Middle {
                inner: InnerMost {
                    val: 123
                }
            }
        };
    }
}
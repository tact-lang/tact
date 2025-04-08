struct Nest {
    n: Int;
}

struct Wrap1 {
    f: Nest;
}

struct Wrap2 {
    f: Wrap1;
}

struct Wrap3 {
    f: Wrap2;
}

contract FourDeep {
    data: Wrap3;
    init() {
        self.data = Wrap3{
            f: Wrap2{
                f: Wrap1{
                    f: Nest{
                        n: 123
                    }
                }
            }
        };
    }
    receive() {
        let _ = self.data.f.f.f.n;
    }
}
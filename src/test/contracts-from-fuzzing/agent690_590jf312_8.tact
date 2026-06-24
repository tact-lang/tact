struct Deep1 { next: Deep2; }
struct Deep2 { next: Deep3; }
struct Deep3 { next: Deep4; }
struct Deep4 { next: Deep5; }
struct Deep5 { inner: Int; }

contract Test {
    chain: Deep1;

    init() {
        self.chain = Deep1{
            next: Deep2{
                next: Deep3{
                    next: Deep4{
                        next: Deep5{ inner: 42 }
                    }
                }
            }
        };
    }
}
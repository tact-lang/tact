struct Deep1 { val: Int; }
struct Deep2 { next: Deep1; }
struct Deep3 { next: Deep2; }
struct Deep4 { next: Deep3; }
struct Deep5 { next: Deep4; }

contract TestContract {
    chain: Deep5;

    init() {
        self.chain = Deep5{
            next: Deep4{
                next: Deep3{
                    next: Deep2{
                        next: Deep1{ val: 42 }
                    }
                }
            }
        };
    }
}

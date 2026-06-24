struct L5 { val: Int; }
struct L4 { sub: L5; }
struct L3 { sub: L4; }
struct L2 { sub: L3; }
struct L1 { sub: L2; }

contract FiveDeep {
    data: L1;

    init() {
        self.data = L1{
            sub: L2{
                sub: L3{
                    sub: L4{
                        sub: L5{ val: 42 }
                    }
                }
            }
        };
    }
}

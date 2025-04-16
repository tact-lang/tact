struct W { w: Int }

struct V { w: W }

struct U { v: V }

struct T { u: U }

struct S { t: T }

contract DeepChain {
    s: S;
    init() {
        self.s = S{
            t: T{
                u: U{
                    v: V{
                        w: W{ w: 1 }
                    }
                }
            }
        };
    }
}
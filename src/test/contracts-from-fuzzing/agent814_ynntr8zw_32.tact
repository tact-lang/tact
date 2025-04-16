// optional of deeply nested struct chain
struct L4 { x: Int; }
struct L3 { l4: L4; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

struct WrapOpt {
    payload: L1?;
}

contract OptDeepChain {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{
            payload: L1{
                l2: L2{
                    l3: L3{
                        l4: L4{
                            x: 999
                        }
                    }
                }
            }
        };
    }
}
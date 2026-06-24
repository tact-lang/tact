struct LongNestedChain {
    next: Next1;
}

struct Next1 {
    next: Next2;
}

struct Next2 {
    next: Next3;
}

struct Next3 {
    next: Next4;
}

struct Next4 {
    endVal: Int;
}

contract DeepChainTest {
    chain: LongNestedChain;
    init() {
        self.chain = LongNestedChain{
            next: Next1{
                next: Next2{
                    next: Next3{
                        next: Next4{
                            endVal: 777
                        }
                    }
                }
            }
        };
    }
}
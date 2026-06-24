struct Chain1 {
    chain2: Chain2;
}

struct Chain2 {
    chain3: Chain3;
}

struct Chain3 {
    chain4: Chain4?;
}

struct Chain4 {
    chain5: Chain5?;
}

struct Chain5 {
    val: Int;
}

contract ChainTest {
    c1: Chain1;

    init() {
        self.c1 = Chain1{
            chain2: Chain2{
                chain3: Chain3{
                    chain4: Chain4{
                        chain5: Chain5{
                            val: 777
                        }
                    }
                }
            }
        };
    }
}
struct Chain1 {
    val: Int; 
}

struct Chain2 {
    chain1: Chain1;
}

struct Chain3 {
    chain2: Chain2;
}

struct Chain4 {
    chain3: Chain3;
}

struct Chain5 {
    chain4: Chain4;
}

struct Chain6 {
    chain5: Chain5;
}

struct Chain7 {
    chain6: Chain6;
}

struct Chain8 {
    chain7: Chain7;
}

contract MaxDepthChain {
    data: Chain8;

    init() {
        self.data = Chain8{ chain7: Chain7{ chain6: Chain6{ chain5: Chain5{ chain4: Chain4{ chain3: Chain3{ chain2: Chain2{ chain1: Chain1{ val: 42 }}}}}}} };
    }
}
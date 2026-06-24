// nested optional without recursion should work
struct ChainOpt2 {
    next: ChainOpt3?;
}

struct ChainOpt3 {
    val: Int;
}

contract ChainOptContract {
    chain: ChainOpt2;

    init() {
        self.chain = ChainOpt2{
            next: ChainOpt3{ val: 5 }
        };
    }
}
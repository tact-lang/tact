struct Tiny {
    b: Bool;
}

struct Chain {
    next: Tiny;
}

contract TestContract {
    data: Chain;

    init() {
        self.data = Chain{
            next: Tiny{b:true}
        };
    }
}
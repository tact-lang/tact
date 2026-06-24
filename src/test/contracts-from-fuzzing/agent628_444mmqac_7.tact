struct Chain4 {
    next: Chain5;
}
struct Chain5 {
    next: Chain6;
}
struct Chain6 {
    leaf: Int;
}

contract LinearDeep {
    chain: Chain4;

    init() {
        self.chain = Chain4{ next: Chain5{ next: Chain6{ leaf: 777 } } };
    }
}
struct Chain1 { next: Chain2?; val: Int; }
struct Chain2 { next: Chain3?; val: Int; }
struct Chain3 { next: Chain4?; val: Int; }
struct Chain4 { next: Chain5?; val: Int; }
struct Chain5 { val: Int; }

contract ChainNestedOptional {
    chain: Chain1;

    init() {
        self.chain = Chain1{ next: null, val: 1 };
    }
}
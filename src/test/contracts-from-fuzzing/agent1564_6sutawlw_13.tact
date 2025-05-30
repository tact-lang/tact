struct Chain3 {
    s: String;
}

struct Chain2 {
    chain3: Chain3;
}

struct Chain1 {
    chain2: Chain2;
}

contract NestedChains {
    head: Chain1;

    init() {
        self.head = Chain1{ chain2: Chain2{ chain3: Chain3{ s: "abc" } } };
    }
}
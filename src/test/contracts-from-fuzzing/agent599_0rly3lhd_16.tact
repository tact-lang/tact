struct Chain1 { x: Int; }
struct Chain2 { chain: Chain1; }
struct Chain3 { chain: Chain2; }
struct Chain4 { chain: Chain3; }
struct Chain5 { chain: Chain4; }

contract TestContract {
    deep: Chain5;

    init() {
        self.deep = Chain5{ chain: Chain4{ chain: Chain3{ chain: Chain2{ chain: Chain1{ x: 42 }}}}};
    }
}
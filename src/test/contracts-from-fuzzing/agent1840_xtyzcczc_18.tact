struct Chain1 { val: Int; }
struct Chain2 { v: Chain1; }
struct Chain3 { vv: Chain2; }
struct Chain4 { vvv: Chain3; }

contract ChainStore {
    store: Chain4;
    init() {
        self.store = Chain4{
            vvv: Chain3{ vv: Chain2{ v: Chain1{ val:99 } } }
        };
    }
}
struct Chain1 { f: Int; }
struct Chain2 { f: Chain1; }
struct Chain3 { f: Chain2; }
struct Chain4 { f: Chain3; }
struct Chain5 { f: Chain4; }
struct Chain6 { f: Chain5; }
struct Chain7 { f: Chain6; }

contract LongChain {
    val: Chain7;
    init() {
        self.val = Chain7{ f: Chain6{ f: Chain5{ f: Chain4{ f: Chain3{ f: Chain2{ f: Chain1{ f: 33 }}}}}}};
    }
}
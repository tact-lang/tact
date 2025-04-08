struct Chain1 { x: Int }
struct Chain2 { c1: Chain1 }
struct Chain3 { c2: Chain2 }
struct Chain4 { c3: Chain3 }
struct Chain5 { c4: Chain4 }
struct Chain6 { c5: Chain5 }

contract DeepChain {
    obj: Chain6;

    init() {
        self.obj = Chain6{ c5: Chain5{ c4: Chain4{ c3: Chain3{ c2: Chain2{ c1: Chain1{ x: 101 } } } } } };
    }
}

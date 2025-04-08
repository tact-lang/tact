struct Chain1 { val:Int; }
struct Chain2 { val:Chain1; }
struct Chain3 { val:Chain2; }

contract DeepChainTest {
    d: Chain3;

    init() {
        self.d = Chain3{ val: Chain2{ val: Chain1{ val: 77 } } };
    }
}
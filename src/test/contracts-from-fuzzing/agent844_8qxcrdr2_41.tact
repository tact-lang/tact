struct Chain1 { next: Chain2 }
struct Chain2 { next: Chain3 }
struct Chain3 { next: Chain4 }
struct Chain4 { val: Int }

contract DeepChain {
    root: Chain1;

    init() {
        self.root = Chain1{ next: Chain2{ next: Chain3{ next: Chain4{val:99} } } };
    }

    receive() {
        let _=self.root;
    }
}
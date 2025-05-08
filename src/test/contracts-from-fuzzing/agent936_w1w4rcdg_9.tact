struct Chain1 {
    val: Int;
}

struct Chain2 {
    nested: Chain1;
}

struct Chain3 {
    nested: Chain2;
}

struct Chain4 {
    nested: Chain3;
}

struct Chain5 {
    nested: Chain4;
}

contract ChainContract {
    cc: Chain5;

    init() {
        self.cc = Chain5{ nested: Chain4{ nested: Chain3{ nested: Chain2{ nested: Chain1{ val: 42 }}}}};
    }

    receive() {
        let _ = self.cc.nested.nested.nested.nested.val;
    }
}
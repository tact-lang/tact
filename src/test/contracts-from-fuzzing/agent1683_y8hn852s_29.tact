struct Chain1 {
    val: Int;
}
struct Chain2 {
    c1: Chain1;
}
struct Chain3 {
    c2: Chain2;
}
struct Chain4 {
    c3: Chain3;
}
struct Chain5 {
    c4: Chain4;
}
struct Chain6 {
    c5: Chain5;
}
struct Chain7 {
    c6: Chain6;
}

contract Nest7 {
    val: Chain7;

    init() {
        self.val = Chain7{ c6: Chain6{ c5: Chain5{ c4: Chain4{ c3: Chain3{ c2: Chain2{ c1: Chain1{ val:1 } } } } } } };
    }

    receive() {
        self.val = Chain7{ c6: Chain6{ c5: Chain5{ c4: Chain4{ c3: Chain3{ c2: Chain2{ c1: Chain1{ val:2 } } } } } } };
    }
}
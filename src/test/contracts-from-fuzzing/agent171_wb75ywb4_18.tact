struct Chain1 {
    next: Chain2;
}
struct Chain2 {
    next: Chain3;
}
struct Chain3 {
    end: Int;
}

contract ChainTest {
    val: Chain1;
    init() {
        self.val = Chain1{ next: Chain2{ next: Chain3{ end: 99 }}};
    }
}
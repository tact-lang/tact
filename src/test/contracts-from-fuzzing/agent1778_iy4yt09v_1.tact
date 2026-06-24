struct Inner {
    flag: Bool;
    count: Int;
}

contract NestedTest {
    data: Inner;
    
    init() {
        self.data = Inner{flag: true, count: 1};
    }
}
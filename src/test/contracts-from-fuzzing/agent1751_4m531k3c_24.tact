struct Inner {
    num: Int?;
}

contract OptChainTest {
    data: Inner?;

    init() {
        self.data = Inner{
            num: 55
        };
    }

    receive() {}
}
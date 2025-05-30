struct Inner {
    x: Int?;
}

contract TestContract {
    nestedOpt: Inner?;
    receive() {
        self.nestedOpt = Inner{x: 11};
    }
}
struct Outer {
    x: Int?;
}

contract TestContract {
    nestedOpt: Outer? = null;
    receive() {
        self.nestedOpt = Outer{x: 42};
    }
}
struct InnerOpt {
    b: Int?;
}

contract TestContract {
    nestedOpt: InnerOpt = InnerOpt{ b: 5 };
    receive() {
        let _ = self.nestedOpt;
    }
}
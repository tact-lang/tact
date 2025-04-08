struct InnerOpt {
    b: Int?;
}

contract TestContract {
    nestedOpt: InnerOpt = InnerOpt{ b: null };
    receive() {
        let _ = self.nestedOpt;
    }
}
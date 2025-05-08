struct WrappedOpt {
    value: Int?;
}

contract WrapOptStorage {
    data: WrappedOpt?;

    init() {
        self.data = null;
    }
}

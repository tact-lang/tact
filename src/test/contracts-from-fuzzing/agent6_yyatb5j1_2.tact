struct Inner {
    flag: Bool = false;
    data: Int?;
}

contract TestContract {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}
struct NestedOpt {
    inner: Bool?;
}

contract TestContract {
    myField: NestedOpt?;

    init() {
        self.myField = null;
    }
}
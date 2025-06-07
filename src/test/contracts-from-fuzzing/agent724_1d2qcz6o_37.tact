struct NestedOpt {
    x: Int? = null;
    y: Int? = null;
}

contract TestContract {
    no: NestedOpt?;

    init() {
        self.no = NestedOpt{ x: 123 };
    }
}
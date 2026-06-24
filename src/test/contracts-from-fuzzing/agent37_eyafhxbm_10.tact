struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    no: NestedOpt? = null;

    init() {
        self.no = NestedOpt{foo: 5, bar: null};
    }
    receive() {}
}
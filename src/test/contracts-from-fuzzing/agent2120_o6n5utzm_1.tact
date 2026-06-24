struct Inner { a: Int; }

contract SingleNestedOptional {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = null;
    }
}
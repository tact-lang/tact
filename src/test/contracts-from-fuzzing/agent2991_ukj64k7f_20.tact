contract EmptyParamContract() {
    // no fields or variables
}

contract LazyInit {
    field: Int;
    init() {
        self.field = 42;
    }
}
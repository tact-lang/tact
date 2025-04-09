struct NestedEmptyDefaultOpt {
    val: Int?;
}

contract OptionalStructDefault {
    data: NestedEmptyDefaultOpt?;

    init() {
        self.data = null;
    }
}
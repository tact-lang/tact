struct NestedOptional {
    val: Int?;
}

contract TestContract {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}

struct AlmostEmpty {
    val: Int;
}

contract TrivialField {
    field: AlmostEmpty;

    init() {
        self.field = AlmostEmpty{ val: 0 };
    }
}
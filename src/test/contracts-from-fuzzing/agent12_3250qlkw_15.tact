struct DoublyNestedOpt {
    i: Int?;
    nested: Int?;
}

contract NestedNulls {
    val: DoublyNestedOpt?;

    init() {
        self.val = null;
    }
}
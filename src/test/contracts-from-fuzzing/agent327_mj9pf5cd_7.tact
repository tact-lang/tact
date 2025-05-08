struct Something {
    a: Int;
    b: Int;
}

contract OptionalTopLevel2 {
    val: Something?;

    init() {
        // leave self.val unassigned intentionally
    }
}

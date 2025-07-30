struct SmallNestedOpt {
    x: Int?;
    y: Bool?;
}

contract SmallOptNested {
    val: SmallNestedOpt?;

    init() {
        self.val = SmallNestedOpt { x: 5, y: null };
    }
}
struct NestedOption {
    x: Int;
    y: Bool?;
}

contract FieldOptStruct {
    nestedOpt: NestedOption?;

    init() {
        self.nestedOpt = null;
    }
}
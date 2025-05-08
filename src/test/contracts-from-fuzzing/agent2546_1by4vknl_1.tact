struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract DeepOptionals {
    data: NestedOpt?;

    init() {
        self.data = null;
    }
}
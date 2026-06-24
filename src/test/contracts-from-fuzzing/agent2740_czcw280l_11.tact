struct NestedOpt {
    x: Int?;
}

contract OptionalFieldInit {
    no: NestedOpt?;

    init() {
        self.no = null;
    }
}
struct NestedOptStruct {
    x: Int;
    y: Bool?;
}

contract OptionalFieldContract {
    data: NestedOptStruct?;

    init() {
        self.data = null;
    }
}
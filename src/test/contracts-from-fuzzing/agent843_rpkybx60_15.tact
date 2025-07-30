struct InnerData {
    x: Int;
    y: Bool?;
}

contract OptNestedField {
    data: InnerData?;

    init() {
        self.data = InnerData{ x: 101, y: false };
    }
}

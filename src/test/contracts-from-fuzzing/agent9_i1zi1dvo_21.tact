struct Some {
    x: Int;
    y: Int?;
}

contract OptionalInStructFlat {
    data: Some;

    init() {
        self.data = Some { x: 1, y: null };
    }
}
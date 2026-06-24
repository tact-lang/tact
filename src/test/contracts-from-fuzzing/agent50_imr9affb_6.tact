struct Deep {
    level: Int;
    note: String;
}

contract OptionalNested {
    data: Deep?;

    init() {
        self.data = null;
    }
}
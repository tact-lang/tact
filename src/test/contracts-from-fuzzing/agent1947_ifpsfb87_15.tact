struct Container {
    x: Int?;
    y: Int?;
}

contract OptionalStruct {
    data: Container?;
    init() {
        self.data = null;
    }
}
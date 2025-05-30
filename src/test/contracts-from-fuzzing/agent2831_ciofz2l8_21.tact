struct InnerOpted {
    x: Int?;
    y: Bool?;
}

contract OptStructField {
    data: InnerOpted?;

    init() {
        self.data = null;
    }
}

struct OptInner {
    mark: Bool?;
    text: String?;
}

contract OptStructOptFields {
    point: OptInner?;

    init() {
        self.point = null;
    }
}
struct Info {
    title: String?;
    active: Bool?;
}

contract Test {
    info: Info?;

    init() {
        self.info = null;
    }
}
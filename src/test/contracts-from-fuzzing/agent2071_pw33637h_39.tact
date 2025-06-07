struct Outsider {
    a: Int?;
    b: Bool?;
}

contract TopFieldOption {
    data: Outsider?;

    init() {
        self.data = null;
    }
}
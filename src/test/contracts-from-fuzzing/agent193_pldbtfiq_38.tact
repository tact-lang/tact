struct Info {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalOfNullable {
    data: Info?;

    init() {
        self.data = null;
    }
}
struct HasStringOptional {
    id: Int;
    comment: String?;
}

contract OptStringStorage {
    info: HasStringOptional;

    init() {
        self.info = HasStringOptional {
            id: 999,
            comment: null
        };
    }
}
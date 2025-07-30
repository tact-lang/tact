struct AllOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract BulkOptionals {
    state: AllOptionals;

    init() {
        self.state = AllOptionals{ x: null, y: null, z: null };
    }
}
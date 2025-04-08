contract NullStringOptInit {
    description: String?;

    init() {
        self.description = null;
    }
}
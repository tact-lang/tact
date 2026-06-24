struct OptionalComposite {
    name: String?;
    count: Int?;
}

contract HasOptionalComposite {
    data: OptionalComposite?;

    init() {
        self.data = null;
    }
}

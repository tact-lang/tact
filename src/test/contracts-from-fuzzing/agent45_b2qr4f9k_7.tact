struct OuterOpt {
    id: Int;
    label: String?;
}

contract OptionalStructField {
    item: OuterOpt?;

    init() {
        self.item = OuterOpt{
            id: 10,
            label: null
        };
    }
}
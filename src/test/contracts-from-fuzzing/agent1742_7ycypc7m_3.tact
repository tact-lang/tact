struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract MultipleOptionalStructField {
    optStructField: ManyOptionals;

    init() {
        self.optStructField = ManyOptionals{};
    }
}
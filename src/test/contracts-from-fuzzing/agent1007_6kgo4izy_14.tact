struct DeepOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract DefaultsWithOpt {
    field: DeepOptionals?;

    init() {
        self.field = null;
    }
}
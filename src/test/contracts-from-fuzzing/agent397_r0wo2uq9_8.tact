struct Optionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
}

contract OptionalFields {
    data: Optionals;

    init() {
        self.data = Optionals{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: null
        };
    }
}
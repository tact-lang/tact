struct ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Int?;
    f5: String?;
}

contract OptionalFields {
    store: ManyOptionals;

    init() {
        self.store = ManyOptionals{
            f1: null,
            f2: true,
            f3: null,
            f4: 777,
            f5: "test"
        };
    }
}
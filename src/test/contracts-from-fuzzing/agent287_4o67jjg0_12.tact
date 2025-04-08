struct WithManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract ManyOptionalDefaults {
    data: WithManyOptionals;
    init() {
        self.data = WithManyOptionals{};
    }
}
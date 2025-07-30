struct WithOptionals {
    foo: Int?;
    bar: Bool?;
    txt: String?;
}

contract OptionalStructField {
    field: WithOptionals;
    init() {
        self.field = WithOptionals{foo: null, bar: true, txt: null};
    }
}
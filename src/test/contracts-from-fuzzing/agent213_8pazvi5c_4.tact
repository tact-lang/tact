struct OptionalFields {
    foo: Int?;
    bar: Bool?;
    txt: String?;
}

contract TestOptionals {
    opts: OptionalFields = OptionalFields{foo: null, bar: null, txt: null};
}
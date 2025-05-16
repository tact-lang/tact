contract NestedOptionalsDirect {
    optStruct: HasNestedOptionals?;

    init() {
        self.optStruct = null;
    }
}

struct HasNestedOptionals {
    a: Int?;
    b: Bool?;
}
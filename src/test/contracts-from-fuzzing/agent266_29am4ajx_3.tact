struct OptInner {
    value: Int?;
    extra: Bool;
}

contract OptionalInsideContract {
    persistentStruct: OptInner;

    init() {
        self.persistentStruct = OptInner{
            value: null,
            extra: false,
        };
    }
}
struct InnerStruct {
    foo: Int?;
    bar: Bool;
}

contract OptionalFieldHolder {
    val: InnerStruct?;

    init() {
        self.val = null;
    }
}
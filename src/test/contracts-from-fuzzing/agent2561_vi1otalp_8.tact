struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalMulti {
    innerOpt: InnerStruct?;
    count: Int;
    status: Bool?;
    note: String;

    init() {
        self.innerOpt = null;
        self.count = 0;
        self.status = null;
        self.note = "";
    }
}
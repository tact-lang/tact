struct OptionalStruct {
    i: Int;
    s: String;
    f: Bool;
}

contract OptStructNullable {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{
            i: 5,
            s: "text",
            f: true
        };
    }
}
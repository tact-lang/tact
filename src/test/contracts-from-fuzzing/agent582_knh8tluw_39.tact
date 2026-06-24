struct MidStruct {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract StructAsField {
    inner: MidStruct;

    init() {
        self.inner = MidStruct{
            f1: 1,
            f2: true,
            f3: "s"
        };
    }
}

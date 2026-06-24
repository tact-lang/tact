struct OptionalStruct2 {
    val: Int?;
    s: String?;
    nested: OptionalStruct3?;
}

struct OptionalStruct3 {
    flag: Bool?;
}

contract Test {
    f: OptionalStruct2;

    init() {
        self.f = OptionalStruct2 {
            val: null,
            s: null,
            nested: null
        };
    }
    receive() {}
}
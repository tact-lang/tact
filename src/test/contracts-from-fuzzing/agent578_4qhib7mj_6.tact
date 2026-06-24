struct OptionalInStruct {
    val: Int?;
    flag: Bool?;
    bigstr: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    a: Int;
    b: Bool;
}

contract OptTest {
    some: OptionalInStruct;

    init() {
        self.some = OptionalInStruct {
            val: null,
            flag: null,
            bigstr: null,
            nested: null
        };
    }
}
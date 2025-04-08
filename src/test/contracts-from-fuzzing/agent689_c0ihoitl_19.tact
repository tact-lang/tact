struct WithManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MultiTypesTest {
    data: WithManyTypes;

    init() {
        self.data = WithManyTypes{
            a: -1,
            b: true,
            c: "z",
            d: null,
            e: false,
            f: null,
        };
    }
}
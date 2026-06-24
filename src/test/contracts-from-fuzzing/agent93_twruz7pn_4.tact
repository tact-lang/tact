struct MultiOptional {
    foo: Int?;
    bar: String?;
    magic: Bool?;
    owner: Address?;
}

contract MultiOptTest {
    s: MultiOptional;

    init() {
        self.s = MultiOptional{
            foo: null,
            bar: "magic",
            magic: true,
            owner: null,
        };
    }
}
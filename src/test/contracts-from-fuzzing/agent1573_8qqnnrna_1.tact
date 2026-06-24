struct InnerOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct DeepNested {
    nested: InnerOptionals;
    anotherInt: Int;
    flag: Bool;
}

contract NestedStructsTest {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            nested: InnerOptionals{
                a: 123,
                b: true,
                c: "test",
            },
            anotherInt: 42,
            flag: false,
        };
    }
}
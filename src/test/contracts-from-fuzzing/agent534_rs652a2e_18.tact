struct OptionalStringNested {
    name: String?;
    info: Info?;
}

struct Info {
    data: Int;
    flag: Bool;
}

contract OptStrNestTest {
    item: OptionalStringNested;

    init() {
        self.item = OptionalStringNested{
            name: null,
            info: null,
        };
    }
}
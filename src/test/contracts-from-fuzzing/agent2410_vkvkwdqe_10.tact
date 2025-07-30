struct NestedStr {
    name: String;
    val: Int;
}

struct HasManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: NestedStr?;
}

contract OptionalFieldVariantsTest {
    data: HasManyOptionals;

    init() {
        self.data = HasManyOptionals{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
        };
    }
}
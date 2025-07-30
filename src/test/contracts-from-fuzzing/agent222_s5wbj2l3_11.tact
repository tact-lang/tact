struct BoolOptionals {
    f1: Bool;
    f2: Bool?;
    f3: Bool?;
    f4: Bool;
}

contract BoolOptionalTest {
    data: BoolOptionals;

    init() {
        self.data = BoolOptionals{
            f1: true,
            f2: null,
            f3: false,
            f4: true
        };
    }
}
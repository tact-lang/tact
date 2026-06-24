struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructFieldsTest {
    val: MultipleOptionals;

    init() {
        self.val = MultipleOptionals{
            a: null,
            b: true,
            c: null
        };
    }
}
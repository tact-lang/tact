struct MultipleOptionals {
    first: Int?;
    second: String?;
    third: Bool?;
}

contract OptionalFieldsTest {
    val: MultipleOptionals;
    init() {
        self.val = MultipleOptionals{first: null, second: null, third: null};
    }
}
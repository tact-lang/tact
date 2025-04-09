// OPTIONAL primitive with default value *other than* null (should fail)
contract OptionalNotNullDefault {
    foo: Int? = 5;

    init() {
        self.foo = 5;
    }
}
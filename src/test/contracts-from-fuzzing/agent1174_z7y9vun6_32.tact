struct DefaultedFields {
    a: Int = 10;
    b: Bool = true;
    c: String = "x";
}

contract UseDefaultsTest {
    df: DefaultedFields = DefaultedFields{};
}
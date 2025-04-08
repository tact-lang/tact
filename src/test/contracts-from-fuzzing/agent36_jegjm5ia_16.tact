struct OptionalString {
    name: String? = null;
    note: String = "hi";
}

contract OptionalStringTest {
    os: OptionalString = OptionalString{};
}
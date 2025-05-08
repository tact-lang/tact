struct SerializeDefault {
    a: Int as uint16 = 1234;
    b: Int as int8 = -8;
}

contract SerializeDefaultsTest {
    data: SerializeDefault = SerializeDefault{};
}
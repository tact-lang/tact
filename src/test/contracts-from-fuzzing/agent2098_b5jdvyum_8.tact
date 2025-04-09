struct WithLongDefaults {
    a: Int = 123456789012345678901234567890;
    b: Int = -98765432109876543210987654321;
}

contract LongDefaults {
    data: WithLongDefaults = WithLongDefaults{};
}

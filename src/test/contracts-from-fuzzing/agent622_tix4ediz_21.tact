contract SerializationOrderTest {
    small: Int as uint4 = 7;
    medium: Int as int16 = 123;
    large: Int as uint256 = pow(2, 255);
    flag: Bool = true;

    init() {}
}
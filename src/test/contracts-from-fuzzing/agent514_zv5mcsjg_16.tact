struct SmallInt {
    x: Int as int64 = 12345678901234567890;
}

contract BadInit {
    data: SmallInt = SmallInt{};
}
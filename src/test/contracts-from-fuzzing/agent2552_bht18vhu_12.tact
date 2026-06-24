struct DefaultMixed {
    a: Int = 1;
    b: Int?;
    c: String = "z";
    d: Bool?;
}

contract PersistDefaultOptInit {
    data: DefaultMixed = DefaultMixed{};
}
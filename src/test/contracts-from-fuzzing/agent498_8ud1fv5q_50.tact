struct NumericDefault {
    i: Int as uint8 = 300; // default exceeds bit size
}

contract TestNumericDefault {
    v: NumericDefault = NumericDefault{};
}
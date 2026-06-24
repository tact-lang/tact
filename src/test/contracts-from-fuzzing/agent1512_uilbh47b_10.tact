contract TestContract {
    smallInt: Int as uint8 = 42;
    bigInt: Int as int256 = -12345;
    shortBool: Bool = true;
    tinyInt: Int as int4 = 7;
    coinVal: Int as coins = 1_000_000_000;

    init() {}
}
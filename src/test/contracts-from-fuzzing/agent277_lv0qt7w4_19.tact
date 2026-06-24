contract Weird {
    bigInt: Int = 99999999999999999999999999;
    tinyInt: Int as uint1 = 1;
    midInt: Int as uint120 = 10000000000;
    optBigStr: String? = null;
    flag: Bool = true;
    init() {}
}
fun returnConst(): Int {
    return 7;
}

contract CallInDefault {
    x: Int = returnConst();

    init() {}
}
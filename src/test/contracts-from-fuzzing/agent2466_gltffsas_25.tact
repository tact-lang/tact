struct Reserved {
    workchain: Int;
    address: Int;
}

contract ReservedNames {
    addr: Reserved = Reserved{workchain:0,address:0};
    init() {}
}
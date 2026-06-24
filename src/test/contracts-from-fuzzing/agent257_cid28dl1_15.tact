struct Packed {
    small: Int as uint32;
    neg: Int as int8;
}

contract SerializeStruct {
    s: Packed = Packed{ small: 5, neg: -3 };
    init() {}
}
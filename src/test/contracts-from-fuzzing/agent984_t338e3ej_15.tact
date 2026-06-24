struct InOrder {
    a: Int as uint8;
    b: Int as uint64;
    c: Int as int256;
}

contract SerializedWidths {
    data: InOrder = InOrder{a: 10, b: 20, c: 30};
}
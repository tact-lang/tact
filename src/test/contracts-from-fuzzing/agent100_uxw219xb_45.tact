struct BoolInt {
    b: Bool;
    i: Int;
}

contract DefValStructField {
    s: BoolInt = BoolInt{b:true, i:7};
}
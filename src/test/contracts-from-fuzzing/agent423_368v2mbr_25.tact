struct Packed {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

contract PackedBits {
    data: Packed = Packed{ a:true, b:true, c:false, d:false };
}
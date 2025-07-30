struct Mid1 { x: Int; y: Bool; }
struct Mid2 { z: Address; w: Cell; }
struct Top {
    a: Mid1;
    b: Mid2;
    c: Mid1;
    d: Mid2;
}

contract CrossStructs(
    param: Top,
    optParam: Top?,
) {}
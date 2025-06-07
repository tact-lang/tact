struct S {
    x: Int;
    y: Bool;
    z: Int?;
}

contract DefaultStruct {
    s: S = S{ x: 1, y: true, z: null };
    init() {}
}
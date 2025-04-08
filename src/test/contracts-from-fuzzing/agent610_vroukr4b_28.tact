struct D {
    z: Int?;
    w: Bool?;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract DeepParams(
    a: A?,
    someInt: Int?,
    someBool: Bool?,
    someStr: String?,
) {}
struct S {
    a: Int?; 
    b: Bool?; 
    c: Inner?;
}

struct Inner {
    x: Int;
}

contract OptStructs {
    s: S = S{ a: null, b: null, c: null };
}
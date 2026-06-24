struct Struct1 {
    x: Int;
}

struct Struct2 {
    s: Struct1;
}

struct Struct3 {
    s: Struct2;
}

struct Struct4 {
    s: Struct3;
}

struct Struct5 {
    s: Struct4;
}

struct Struct6 {
    s: Struct5;
}

struct Struct7 {
    s: Struct6;
}

struct Struct8 {
    s: Struct7;
}

contract Deep8Layers {
    d: Struct8;
    init() {
        self.d = Struct8{ s: Struct7{ s: Struct6{ s: Struct5{ s: Struct4{ s: Struct3{ s: Struct2{ s: Struct1{ x: 1 } } } } } } } };
    }
}
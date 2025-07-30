struct DeepInner {
    q: Int;
}

struct MidInner {
    p: DeepInner;
    r: Int?;
}

struct Outer {
    m: MidInner;
    n: String;
}

contract DeepNested {
    data: Outer = Outer{ m: MidInner{ p: DeepInner{ q: 5 }, r: null }, n: "text" };
}
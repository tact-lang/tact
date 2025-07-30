struct SubNested1 { x: Int; }
struct SubNested2 { y: Bool; }
struct Outer {
    n1: SubNested1?;
    n2: SubNested2?;
    s: String;
}

contract OptionalNestedMany {
    f: Outer;

    init() {
        self.f = Outer{
            n1: null,
            n2: SubNested2{ y: true },
            s: "hi"
        };
    }
}
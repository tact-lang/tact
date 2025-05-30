struct DeepNested {
    inner: Coord;
    flag: Bool;
}

struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    nested: DeepNested = DeepNested{ inner: Coord{ x: 0, y: 0 }, flag: true };
}
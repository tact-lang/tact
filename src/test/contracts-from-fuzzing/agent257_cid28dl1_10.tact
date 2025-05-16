struct Point { x: Int; y: Int; }

struct Wrapper { pos: Point?; }

contract NestedOptionalField {
    w: Wrapper = Wrapper{ pos: null };
    init() {}
}
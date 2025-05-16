struct NestedOptional {
    opt: Coord?;
}

struct Coord {
    x: Int;
    y: Int;
}

contract TestContract {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            opt: Coord{ x: 20, y: 30 }
        };
    }
}
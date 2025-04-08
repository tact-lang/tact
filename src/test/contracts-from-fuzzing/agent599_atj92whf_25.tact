struct Conflict { x: Int; }

struct Outer {
    Conflict: Int;
    inner: Conflict;
}

contract NameClashTest {
    s: Outer;
    init() {
        self.s = Outer{Conflict: 1, inner: Conflict{x:42}};
    }
}
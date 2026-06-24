// Test deep nesting optionals with struct layers
struct Leaf {
    val: Int;
}

struct Mid {
    maybeLeaf: Leaf?;
    tag: String;
}

struct Top {
    maybeMid: Mid?;
    ok: Bool;
}

contract TestContract {
    data: Top?;

    init() {
        self.data = null;
    }
}

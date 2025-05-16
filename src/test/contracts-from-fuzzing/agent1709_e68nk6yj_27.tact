// optional of optional struct itself (shallow option allowed)
struct A {
    val: Int;
}

contract OptOptStructShallow {
    f: A?;
    init() {
        self.f = null;
    }
}
struct First { a: Int; }
struct Second { b: Int; }
struct Combined {
    f: First;
    s: Second;
}

contract CombinedNested {
    c: Combined;

    init() {
        self.c = Combined{ f: First{a:1}, s: Second{b:2} };
    }
}
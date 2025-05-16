struct Nested {
    a: Int = 7;
    b: String = "zzz";
}

struct Outer {
    inner: Nested;
    val: Bool = true;
}

contract Test {
    field1: Bool = false;
    outer: Outer;

    init() {
        self.outer = Outer{ inner: Nested{}, val: true };
    }
}
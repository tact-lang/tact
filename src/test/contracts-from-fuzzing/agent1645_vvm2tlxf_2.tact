struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Outer {
    data: Inner?; // optional struct field
    text: String = "hi";
}

contract Test {
    stored: Outer? = null;

    init() {}
}

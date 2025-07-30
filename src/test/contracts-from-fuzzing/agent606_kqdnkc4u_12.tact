struct Many {
    x: Int = 10;
    y: String = "abc";
}

struct Wrapper {
    nested: Many?;
}

contract Test {
    w: Wrapper = Wrapper{ nested: Many{} };
}
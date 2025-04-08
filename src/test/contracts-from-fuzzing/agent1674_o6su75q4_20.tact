struct Innermost {
    done: Bool;
    code: Int? as uint8;
}

struct Middle {
    inner: Innermost;
}

contract NestedWithSerialization(
    m: Middle,
) {}

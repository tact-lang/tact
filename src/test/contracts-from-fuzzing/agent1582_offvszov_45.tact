struct NestedOptInit {
    foo: Int? = null;
    bar: Bool? = null;
}

struct OutInit {
    inner: NestedOptInit = NestedOptInit{};
    str: String? = null;
}

contract InitTreeDefault {
    val: OutInit = OutInit{};

    receive() {}
}
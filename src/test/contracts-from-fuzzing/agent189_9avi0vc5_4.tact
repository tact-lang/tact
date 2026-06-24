struct Inner {
    a: Int = 10;
    b: Int?;
    c: String? = "hi";
}

contract WithNested {
    nested: Inner = Inner{};
}
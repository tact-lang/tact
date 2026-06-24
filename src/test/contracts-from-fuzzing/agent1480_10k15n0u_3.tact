struct Inner {
    flag: Bool?;
    num: Int?;
}

contract TestContract {
    nested: Inner = Inner{};
}

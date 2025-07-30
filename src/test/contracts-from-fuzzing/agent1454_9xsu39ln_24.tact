struct Inner {
    z: Int = 99;
}

contract NoParamsDefault {
    nested: Inner = Inner{};
}
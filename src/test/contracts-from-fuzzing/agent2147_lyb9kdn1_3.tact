struct Inner {
    x: Int = 1;
    y: Int?;
}

contract DefaultNestedOpt {
    inner: Inner = Inner{};
}
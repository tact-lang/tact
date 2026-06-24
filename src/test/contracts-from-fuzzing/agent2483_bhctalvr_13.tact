struct Inner {
    val1: Int? = null;
    val2: Int? = 42;
    flag: Bool = false;
}

contract TestContract {
    nestedField: Inner = Inner{};
    init() {}
}
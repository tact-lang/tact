struct Nested {
    f1: Int? = null;
    f2: Bool? = null;
    f3: String? = null;
    f4: Slice? = null;
    f5: Address? = null;
}

contract TestContract {
    n: Nested = Nested{};
    init() {}
}
struct DefaultValues {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract TestContract {
    s: DefaultValues = DefaultValues{};
}

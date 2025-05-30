struct Defaults {
    a: Int = 1;
    b: String = "hi";
    c: Bool = false;
    d: Int? = null;
}

contract TestContract {
    data: Defaults = Defaults{};
}
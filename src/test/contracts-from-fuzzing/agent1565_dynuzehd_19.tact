struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
}

contract DefaultsContract {
    val: Defaulted = Defaulted{};
}
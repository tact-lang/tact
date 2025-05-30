struct AllDefault {
    i: Int = 10;
    b: Bool = true;
    s: String = "x";
}

contract ExplicitDefault {
    val: AllDefault = AllDefault{};
}
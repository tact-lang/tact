struct Stru {
    a: Int?;
    b: Bool? = null;
}

contract Buggy {
    s: Stru = Stru{};
}
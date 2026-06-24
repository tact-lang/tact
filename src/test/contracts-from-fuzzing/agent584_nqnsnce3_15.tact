struct Defaults {
    x: Int = 99;
    y: Bool = true;
    s: String = "def";
}

contract Test {
    d: Defaults = Defaults{};
}
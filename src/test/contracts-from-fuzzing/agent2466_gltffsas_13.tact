struct SDefault {
    x: Int = 1;
    y: Bool = false;
    s: String = "mmm";
}

contract Defaults {
    data: SDefault = SDefault{};
    init() {}
}
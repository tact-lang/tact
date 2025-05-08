struct Mixture {
    a: Int as uint4 = 3;
    b: Int as int64 = -9;
    c: Int as uint256 = 255;
    d: Bool = true;
    e: Int = -1;
}

contract TestContract {
    mixVar: Mixture = Mixture{};
}
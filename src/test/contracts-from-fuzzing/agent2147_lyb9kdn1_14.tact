struct BoolNest {
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool?;
    b4: Bool?;
}

contract BoolPacked {
    flags: BoolNest = BoolNest{};
}
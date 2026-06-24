struct MixFields2 {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Address? = null;
    e: Bool = false;
    f: String = "f";
    g: Int = 7;
    h: Bool = true;
    i: String = "i";
    j: Int = 10;
}

contract Test13 {
    mix: MixFields2 = MixFields2{};
}
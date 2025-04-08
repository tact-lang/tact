struct ManyBool {
    a: Bool = true; b: Bool = false; c: Bool = true; d: Bool = false;
    e: Bool = true; f: Bool = false; g: Bool = true; h: Bool = false;
    i: Bool = true; j: Bool = false; k: Bool = true; l: Bool = false;
}

contract OnlyBools {
    persist: ManyBool = ManyBool{};
    init() {}
}
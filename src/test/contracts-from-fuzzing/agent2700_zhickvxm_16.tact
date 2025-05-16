struct SLevel3 {
    c: Int;
}

struct SLevel2 {
    b: SLevel3;
}

struct SLevel1 {
    a: SLevel2;
}

contract OptionalDeep {
    deep: SLevel1?;

    init() {
        self.deep = null;
    }
}
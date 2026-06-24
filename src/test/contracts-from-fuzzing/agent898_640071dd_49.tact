contract OptOptOptDeep {
    deep: L1?;

    init() {
        self.deep = null;
    }
}

struct L1 {
    l2: L2?;
}

struct L2 {
    l3: L3?;
}

struct L3 {
    value: Int?;
}

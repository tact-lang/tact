contract NestedOptLevel2 {
    top: Struct1;
    init() {
        self.top = Struct1{ mid: null };
    }
}

struct Struct1 {
    mid: Struct2?;
}

struct Struct2 {
    leaf: Int?;
}
struct InnerA {
    data: String?;
}

struct InnerB {
    flag: Bool?;
}

struct Middle {
    partA: InnerA?;
    partB: InnerB?;
}

contract MultiNestedOptional {
    core: Middle?;

    init() {
        self.core = null;
    }
}
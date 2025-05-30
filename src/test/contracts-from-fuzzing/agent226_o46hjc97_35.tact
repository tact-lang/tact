struct MultiNestedOpt {
    a: LevelA?;
}

struct LevelA {
    b: LevelB?;
}

struct LevelB {
    c: Int?;
}

contract TestMultiNestedOpt {
    data: MultiNestedOpt;

    init() {
        self.data = MultiNestedOpt {
            a: LevelA {
                b: LevelB { c: null }
            }
        };
    }
}

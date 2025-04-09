contract ComplexNestedNull {
    data: NestedNull;

    init() {
        self.data = NestedNull{
            mid: MidLevel{
                deep: null,
                flag: true
            },
            val: 1
        };
    }
}

struct NestedNull {
    mid: MidLevel;
    val: Int;
}

struct MidLevel {
    deep: DeepLevel?;
    flag: Bool;
}

struct DeepLevel {
    x: Int;
    y: Bool;
}
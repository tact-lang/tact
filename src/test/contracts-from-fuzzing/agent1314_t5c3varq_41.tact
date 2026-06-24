struct SLevel3 {
    s: String;
}

struct SLevel2 {
    x: Int;
    deep: SLevel3;
}

struct SLevel1 {
    flag: Bool;
    nested: SLevel2;
}

contract NestedStructExample {
    val: SLevel1;

    init() {
        self.val = SLevel1 {
            flag: true,
            nested: SLevel2 {
                x: 5,
                deep: SLevel3 {
                    s: "hello",
                }
            },
        };
    }
}
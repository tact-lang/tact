struct LargeDeep {
    f1: Int;
    nested1: NestedLevel1;
}

struct NestedLevel1 {
    f2: Int;
    nested2: NestedLevel2;
}

struct NestedLevel2 {
    f3: Int;
    nested3: NestedLevel3;
}

struct NestedLevel3 {
    f4: Int;
    nested4: NestedLevel4;
}

struct NestedLevel4 {
    f5: Int;
}

contract LargeDeepNested {
    data: LargeDeep;

    init() {
        self.data = LargeDeep {
            f1: 1,
            nested1: NestedLevel1 {
                f2: 2,
                nested2: NestedLevel2 {
                    f3: 3,
                    nested3: NestedLevel3 {
                        f4: 4,
                        nested4: NestedLevel4 {
                            f5: 5
                        }
                    }
                }
            }
        };
    }
}
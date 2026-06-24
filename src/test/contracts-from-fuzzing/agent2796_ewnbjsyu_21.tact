struct Deep {
    s: SubDeep;
}

struct SubDeep {
    s2: SubDeep2;
}

struct SubDeep2 {
    flag: Bool?;
    val: Int;
}

contract ThreeLevel {
    deep: Deep;

    init() {
        self.deep = Deep {
            s: SubDeep {
                s2: SubDeep2 {
                    flag: null,
                    val: 42
                }
            }
        };
    }
}
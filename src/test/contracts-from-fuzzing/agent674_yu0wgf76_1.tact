struct Deep {
    lvl1: Int;
    lvl2: Nested;
}

struct Nested {
    lvl3: Int;
    lvl4: Deeper;
}

struct Deeper {
    lvl5: Int;
    lvl6: Bool?;
}

contract TestContract {
    value: Deep;

    init() {
        self.value = Deep{
            lvl1: 1,
            lvl2: Nested{
                lvl3: 2,
                lvl4: Deeper{
                    lvl5: 3,
                    lvl6: true,
                },
            },
        };
    }
}
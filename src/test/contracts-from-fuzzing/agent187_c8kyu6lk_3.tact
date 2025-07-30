struct Nested {
    lvl1: Int;
    lvl2: Int;
    lvl3: Int;
    lvl4: Int;
    lvl5: Int;
}

struct Wrapper {
    nested1: Nested;
    nested2: Nested;
}

contract StorageNestedTest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested1: Nested{lvl1:1,lvl2:2,lvl3:3,lvl4:4,lvl5:5},
            nested2: Nested{lvl1:6,lvl2:7,lvl3:8,lvl4:9,lvl5:10}
        };
    }
}
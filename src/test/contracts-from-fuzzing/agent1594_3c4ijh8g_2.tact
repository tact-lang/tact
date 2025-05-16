struct NestedLevel3 {
    z: String = "deep";
    optZ: Int?;
}

struct NestedLevel2 {
    y: Bool = true;
    lvl3: NestedLevel3;
}

struct NestedLevel1 {
    x: Int = 42;
    lvl2: NestedLevel2;
}

contract TestNested {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            lvl2: NestedLevel2{
                lvl3: NestedLevel3{
                    optZ: null,
                },
            },
        };
    }

    receive() {}
}
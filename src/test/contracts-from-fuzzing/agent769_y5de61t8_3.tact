struct NestedLevel3 { z: Int; }

struct NestedLevel2 { y: Int; lvl3: NestedLevel3; }

struct NestedLevel1 { x: Int; lvl2: NestedLevel2; }

contract DeepNested {
    deep: NestedLevel1;

    init() {
        self.deep = NestedLevel1{
            x: 1,
            lvl2: NestedLevel2{
                y: 2,
                lvl3: NestedLevel3{
                    z: 3
                }
            }
        };
    }
}
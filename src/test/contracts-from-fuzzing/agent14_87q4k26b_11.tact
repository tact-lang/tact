struct NestedLevel1 { x: Int; y: Bool }
struct NestedLevel2 { lvl1: NestedLevel1; z: Int }
struct NestedLevel3 { lvl2: NestedLevel2; w: Bool }

contract DeepNestTest {
    dd: NestedLevel3;
    init() {
        self.dd = NestedLevel3{
            lvl2: NestedLevel2{
                lvl1: NestedLevel1{
                    x: 10,
                    y: false
                },
                z: 20
            },
            w: true
        };
    }
}
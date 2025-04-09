struct NestedLevel3 { x: Int; y: Bool; }

struct NestedLevel2 { l3: NestedLevel3; flag: Bool; }

struct NestedLevel1 { l2: NestedLevel2; number: Int; }

contract DeepNestedTest {
    deepField: NestedLevel1;

    init() {
        self.deepField = NestedLevel1{
            l2: NestedLevel2{
                l3: NestedLevel3{
                    x: 10,
                    y: false,
                },
                flag: true,
            },
            number: 55,
        };
    }
}
struct DeeplyNestedLevel3 { x: Int; y: Bool; }

struct DeeplyNestedLevel2 { l3: DeeplyNestedLevel3; z: Int; }

struct DeeplyNestedLevel1 { l2: DeeplyNestedLevel2; flag: Bool; }

contract DeepStructNestTest {
    data: DeeplyNestedLevel1;

    init() {
        self.data = DeeplyNestedLevel1 {
            l2: DeeplyNestedLevel2 {
                l3: DeeplyNestedLevel3 { x: 9, y: true },
                z: 20
            },
            flag: false
        };
    }
}
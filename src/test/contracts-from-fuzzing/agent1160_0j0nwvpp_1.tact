struct NestedLevel3 { inner: Int; optionalInner: Int?; flag: Bool; }

struct NestedLevel2 { lvl3: NestedLevel3; text: String; optLvl3: NestedLevel3?; }

struct NestedLevel1 { lvl2: NestedLevel2; optLvl2: NestedLevel2?; id: Int; }

contract DeepNestedContract {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            lvl2: NestedLevel2{
                lvl3: NestedLevel3{
                    inner: 42,
                    optionalInner: null,
                    flag: true,
                },
                text: "Test",
                optLvl3: null,
            },
            optLvl2: null,
            id: 1,
        };
    }
}
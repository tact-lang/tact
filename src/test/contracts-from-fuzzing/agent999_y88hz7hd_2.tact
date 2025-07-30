struct NestedLevel3 { val: Int; }

struct NestedLevel2 { inner: NestedLevel3; opt: Bool?; }

struct NestedLevel1 { lvl2: NestedLevel2; txt: String; }

contract DeepNestedTest {
    storage: NestedLevel1;

    init() {
        self.storage = NestedLevel1{
            lvl2: NestedLevel2{
                inner: NestedLevel3{ val: 42 },
                opt: null
            },
            txt: "hello"
        };
    }
}
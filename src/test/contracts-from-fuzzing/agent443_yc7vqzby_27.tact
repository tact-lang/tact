struct MixOptNested {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    nested: NestedStruct;
}

struct NestedStruct {
    p: Int;
    q: Bool;
}

contract MixOptionalNestedTest {
    m: MixOptNested;

    init() {
        self.m = MixOptNested{
            o1: null,
            o2: true,
            o3: null,
            nested: NestedStruct{
                p: 15,
                q: false
            }
        };
    }
}
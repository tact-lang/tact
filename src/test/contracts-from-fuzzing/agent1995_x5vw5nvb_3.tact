struct DeepNested {
    label: String;
    nested: StructLevel2;
}

struct StructLevel2 {
    sub: StructLevel3;
    flag: Bool;
}

struct StructLevel3 {
    optVal: Int?;
    name: String;
}

contract DeepNestStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            label: "deep dive",
            nested: StructLevel2{
                flag: true,
                sub: StructLevel3{ optVal:null, name:"bottom" }
            }
        };
    }
}
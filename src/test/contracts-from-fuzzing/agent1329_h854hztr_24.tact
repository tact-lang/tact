struct DeeplyNested {
    l1: String;
    l2: String?;
    l3: Bool;
    l4: Int?;
    l5: Int;
}

struct NestLevel2 {
    inner: DeeplyNested;
}

struct NestLevel3 {
    nested: NestLevel2;
}

contract DeepNesting {
    data: NestLevel3;

    init() {
        self.data = NestLevel3{ nested: NestLevel2{ inner: DeeplyNested{
            l1:"a", l2:null, l3:true, l4:null, l5:99 } } };
    }
}

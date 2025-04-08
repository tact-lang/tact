struct InternalNested {
    val: Int; 
}

struct MiddleNested {
    internal: InternalNested;
    flag: Bool;
}

struct OuterAll {
    mid: MiddleNested;
    name: String;
}

contract DeepComposite {
    data: OuterAll;
    init() {
        self.data = OuterAll{
            mid: MiddleNested{
                internal: InternalNested{ val:5 },
                flag:true
            },
            name: "test"
        };
    }
}
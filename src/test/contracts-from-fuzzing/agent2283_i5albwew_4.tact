struct DeepNested {
    x: Int;
    y: Bool;
    message: String;
}

struct MediumNested {
    d1: DeepNested;
    d2: DeepNested;
}

struct TopLevel {
    m: MediumNested;
    another: MediumNested;
}

contract DeepNestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{
            m: MediumNested{
                d1: DeepNested{x:1,y:true,message:"a"},
                d2: DeepNested{x:2,y:false,message:"b"},
            },
            another: MediumNested{
                d1: DeepNested{x:3,y:true,message:"c"},
                d2: DeepNested{x:4,y:false,message:"d"},
            }
        };
    }
}

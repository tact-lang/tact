struct InnerLevel {
    label: String;
    amount: Int;
    flag: Bool;
}

struct MidLevel {
    one: InnerLevel;
    two: InnerLevel;
}

struct OuterLevel {
    left: MidLevel;
    right: MidLevel;
}

contract TreeLikeNested {
    root: OuterLevel;

    init() {
        self.root = OuterLevel{
            left: MidLevel{
                one: InnerLevel{ label:"a",amount:1,flag:true },
                two: InnerLevel{ label:"b",amount:2,flag:false }
            },
            right: MidLevel{
                one: InnerLevel{ label:"c",amount:3,flag:true },
                two: InnerLevel{ label:"d",amount:4,flag:false }
            }
        };
    }
}
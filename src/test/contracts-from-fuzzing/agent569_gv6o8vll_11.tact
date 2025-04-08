struct BigNestedOne {
    a: Int; b: Bool; c: String; d: Int?;
}

struct BigNestedTwo {
    e: BigNestedOne; f: BigNestedOne; g: BigNestedOne;
}

struct BigNested {
    nest1: BigNestedTwo;
    nest2: BigNestedTwo;
}

contract LargeNestContract {
    state: BigNested;

    init() {
        self.state = BigNested{
            nest1: BigNestedTwo{
                e: BigNestedOne{a:1,b:true,c:"a",d:null},
                f: BigNestedOne{a:2,b:false,c:"b",d:null},
                g: BigNestedOne{a:3,b:true,c:"c",d:null}
            },
            nest2: BigNestedTwo{
                e: BigNestedOne{a:4,b:false,c:"d",d:null},
                f: BigNestedOne{a:5,b:true,c:"e",d:null},
                g: BigNestedOne{a:6,b:false,c:"f",d:null}
            }
        };
    }
}
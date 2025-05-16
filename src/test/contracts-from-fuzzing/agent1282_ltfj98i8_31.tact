// Deeply nested struct with fields of primitive, optional, serialization
struct Bottom {
    a: Int as int64;
    b: Bool?;
    c: String;
}
struct Middle {
    x: Bottom;
    y: Bottom;
}
struct Top {
    left: Middle;
    right: Middle;
}

contract DeepMix {
    state: Top;

    init() {
        self.state = Top{
            left: Middle{
                x: Bottom{a:1,b:null,c:"a"},
                y: Bottom{a:2,b:true,c:"b"}
            },
            right: Middle{
                x: Bottom{a:3,b:false,c:"c"},
                y: Bottom{a:4,b:null,c:"d"}
            }
        };
    }
}
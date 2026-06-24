struct MultiDepthOptional {
    o1: Int?;
    o2: Bool?;
    s: BigNested?;
}

struct BigNested {
    val1: Int;
    val2: Bool;
    val3: String;
}

contract NestedOptionalContract {
    data: MultiDepthOptional = MultiDepthOptional{
        o1:null, o2:true, s:null
    };

    init() {
        self.data = MultiDepthOptional{
            o1:5, o2:null, s:BigNested{val1:1,val2:false,val3:"yo"}
        };
    }
}
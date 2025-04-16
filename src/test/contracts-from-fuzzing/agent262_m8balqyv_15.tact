struct Medium {
    x: Int;
    y: Bool;
    z: String;
    w: Address;
}

struct Container {
    m1: Medium;
    m2: Medium;
    flag: Bool;
    note: String;
}

contract StructFields {
    data: Container;
    
    init() {
        self.data = Container{
            m1: Medium{x:1,y:true,z:"hi",w:myAddress()},
            m2: Medium{x:2,y:false,z:"bye",w:myAddress()},
            flag: true,
            note: "note"
        };
    }
}

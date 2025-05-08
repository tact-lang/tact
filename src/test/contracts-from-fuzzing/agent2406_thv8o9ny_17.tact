struct IntBoolString {
    x: Int;
    y: Bool;
    z: String;
}

struct Container {
    v1: IntBoolString;
    v2: IntBoolString;
}

contract NestedRepeatedStructs {
    data: Container;
    
    init() {
        self.data = Container{
            v1: IntBoolString{ x:1,y:true,z:"a" },
            v2: IntBoolString{ x:2,y:false,z:"b" }
        };
    }
}
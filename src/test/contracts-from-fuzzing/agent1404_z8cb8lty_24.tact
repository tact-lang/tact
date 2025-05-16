struct SubField {
    x: Int; y: Bool?; z: String;
}

struct Container {
    s1: SubField;
    s2: SubField;
    s3: SubField;
}

contract TestContainer {
    val: Container;

    init() {
        self.val = Container{
            s1: SubField{x:1,y:true,z:"a"},
            s2: SubField{x:2,y:null,z:"b"},
            s3: SubField{x:3,y:true,z:"c"},
        };
    }
}

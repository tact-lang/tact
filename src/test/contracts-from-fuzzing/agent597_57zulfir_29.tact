struct ManyOptionalStructs {
    s1: Inner?;
    s2: Inner?;
    s3: Inner?;
}

struct Inner {
    x: Int;
    y: String;
}

contract ManyOptStructs {
    packed: ManyOptionalStructs;
    init() {
        self.packed = ManyOptionalStructs{
            s1: Inner{x:1,y:"a"},
            s2: null,
            s3: Inner{x:2,y:"b"}
        };
    }
}
struct MultiType {
    i1: Int;
    bl: Bool;
    s1: String;
    i2: Int as uint32;
    s2: String;
    fl: Bool?;
    s3: String;
}

contract MultipleTypes {
    field: MultiType;
    
    init() {
        self.field = MultiType{
            i1:10, bl:true, s1:"hello", i2:123, s2:"world", fl:null, s3:"end"
        };
    }
}
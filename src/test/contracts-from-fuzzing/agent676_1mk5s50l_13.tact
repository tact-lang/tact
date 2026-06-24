struct LargeStruct {
    i1: Int; i2: Int; i3: Int;
    b1: Bool; b2: Bool; b3: Bool;
    s1: String; s2: String; s3: String;
    o1: Int?; o2: String?; o3: Bool?;
}

contract LargeStructContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            i1:1,i2:2,i3:3,
            b1:true,b2:false,b3:true,
            s1:"a",s2:"b",s3:"c",
            o1:null,o2:null,o3:null
        };
    }
}
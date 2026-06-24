struct DeeplyAnnotated {
    a: Int as uint32;
    b: Int as int16;
    c: Int as uint8;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address?;
}

struct Container {
    val: DeeplyAnnotated;
    count: Int as uint4;
}

contract SerialMix {
    data: Container;
    init() {
        self.data = Container{val:DeeplyAnnotated{a:5,b:-7,c:255,d:null,e:true,f:null,g:null},count:9};
    }
}
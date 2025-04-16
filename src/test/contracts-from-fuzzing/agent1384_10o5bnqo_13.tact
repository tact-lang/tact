struct MultiLayer {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract MultiLayerFields {
    data: MultiLayer;

    init() {
        self.data = MultiLayer{
            a:1,b:true,c:"x",d:myAddress(),
            e:null,f:false,g:null,h:null,
        };
    }
}
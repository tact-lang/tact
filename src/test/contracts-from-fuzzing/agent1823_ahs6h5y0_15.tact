struct LargeOptional {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
}

contract LotsOfOptionals {
    opt: LargeOptional;

    init() {
        self.opt = LargeOptional{
            a:null,b:1,c:null,d:2,e:3,
            f:true,g:null,h:false,i:null,j:true
        };
    }
}
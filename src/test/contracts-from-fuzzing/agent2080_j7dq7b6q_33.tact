struct BigOpt {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: Bool?; h: Bool?; i: Bool?; j: Bool?;
    k: String?; l: String?;
}

contract ManyOptionals {
    val: BigOpt;
    init() {
        self.val = BigOpt{
            a:null,b:null,c:null,d:null,e:null,
            f:null,g:null,h:null,i:null,j:null,
            k:null,l:null
        };
    }
}
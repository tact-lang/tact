struct ManyOptionals {
    a: Int?; b: Int?; c: Int?; d: Int?; e: Int?;
    f: Bool?; g: String?; h: Bool?; i: String?; j: Bool?;
}

contract Test {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            a:null, b:1, c:null, d:4, e:null,
            f:true, g:null, h:false, i:"x", j:null
        };
    }
}
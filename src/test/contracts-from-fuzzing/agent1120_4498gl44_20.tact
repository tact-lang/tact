struct ManyOptional {
    a: Int?; b: Bool?; c: String?; d: Int?;
    e: Bool?; f: String?; g: Int?; h: Bool?; i: String?;
}

contract OptionStruct {
    opt: ManyOptional;
    init() {
        self.opt = ManyOptional{
            a:null,b:true,c:null,d:4,
            e:false,f:"string",g:null,h:null,i:"hi"
        };
    }
}
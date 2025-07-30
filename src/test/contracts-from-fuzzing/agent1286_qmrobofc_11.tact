struct HasMany {
    a: Int; b: Bool; c: String;
    d: Int?; e: Bool?; f: String;
    g: Int; h: Bool; i: String?;
}

contract HasManyFields {
    data: HasMany;

    init() {
        self.data = HasMany{
            a:1,b:true,c:"hi",d:null,e:null,f:"world", g:2,h:false,i:null
        };
    }
}
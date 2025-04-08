struct ManyOptionalBools {
    a: Bool?; b: Bool?; c: Bool?; d: Bool?; e: Bool?; f: Bool?; g: Bool?; h: Bool?;
}

contract OnlyManyOptionals {
    o: ManyOptionalBools;

    init() {
        self.o = ManyOptionalBools{
            a:true, b:null, c:false, d:null, e:true, f:null, g:false, h:null
        };
    }
}

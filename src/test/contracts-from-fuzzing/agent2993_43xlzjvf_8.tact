struct Large {
    a: Int; b: Int;
    c: Bool; d: Bool;
    e: String; f: String;
    g: Int?; h: Bool?;
    i: Address?; j: String;
}

contract BigStruct {
    data: Large;

    init() {
        self.data = Large{
            a:1, b:2,
            c:true, d:false,
            e:"hello", f:"world",
            g:null, h:true,
            i:null, j:"!",
        };
    }
}
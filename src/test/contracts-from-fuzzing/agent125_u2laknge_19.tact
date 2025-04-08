// large struct with mixed optionals and defaults
struct Large {
    a: Int;
    b: Int? = null;
    c: Bool;
    d: Bool? = true;
    e: String;
    f: String? = null;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract LargeFields {
    data: Large;
    
    init() {
        self.data = Large{
            a:1,
            c:true,
            e:"x",
            g:10,
            h:null,
            i:"y",
        };
    }
}
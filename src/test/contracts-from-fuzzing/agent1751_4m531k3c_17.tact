struct BigChunk {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
}

contract OptionalBig {
    optbig: BigChunk?;

    init() {
        self.optbig = BigChunk{
            a:1,b:true,c:"A",
            d:2,e:false,f:"B",
            g:3,h:true,i:"C",
            j:4
        };
    }

    receive() {}
}
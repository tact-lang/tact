struct Wide {
    a: Int;
    b: Bool;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String;
    g: Bool?;
    h: Int?;
    i: Slice?;
    j: String?;
}

contract WideDiverseFields {
    data: Wide;

    init() {
        self.data = Wide{
            a:1, b:true, c:null, d:null, e:null, f:"s",
            g:false, h:2, i:null, j:"t"
        };
    }
}
struct BigMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Int?;
    g: String;
    h: Bool;
    i: Address?;
    j: Int;
}

contract BigMixedTypes {
    data: BigMixed;

    init() {
        self.data = BigMixed{
            a:1, b:true, c:"test", d:myAddress(), e:null, f:null, g:"string", h:false, i:null, j:5
        };
    }
}
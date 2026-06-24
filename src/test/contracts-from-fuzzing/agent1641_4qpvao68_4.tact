struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool;
    f: Int;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
}

contract LotsOfFields {
    data: BigStruct = BigStruct{
        a:1, b:true, c:"c", d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        e:false, f:2, g:"g", h: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        i:3, j:false
    };

    init() {
        self.data = BigStruct{
            a:10, b:false, c:"x", d: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            e:true, f:20, g:"y", h: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            i:30, j:true
        };
    }
}
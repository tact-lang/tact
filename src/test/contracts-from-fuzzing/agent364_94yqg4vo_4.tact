struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
}

contract BigStructContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:true, c:"x", d:myAddress(),
            e:2, f:false, g:"y", h:myAddress(),
            i:3, j:true, k:"z", l:myAddress()
        };
    }
}
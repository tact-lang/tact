struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool;
    i: String;
    j: Int;
    k: Address;
    l: String?;
    m: Bool?;
    n: Int?;
    o: Address;
}

contract LargeStructContract {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            a:1, b:true, c:"c", d:myAddress(), e:null, f:null, g:null, h:false, i:"i",
            j:42, k:myAddress(), l:null, m:true, n:7, o:myAddress()
        };
    }
}

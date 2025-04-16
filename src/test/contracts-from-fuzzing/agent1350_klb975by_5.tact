struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool;
    g: String?;
    h: Address;
    i: Int;
    j: Bool;
}

contract LargeStructContract {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            a:1, b:true, c:"x", d:myAddress(), e:null, f:false, g:null, h:myAddress(), i:2, j:true
        };
    }
}
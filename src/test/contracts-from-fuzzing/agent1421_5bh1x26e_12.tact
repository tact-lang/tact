struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
}

contract LargeStructInStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a:1, b:true, c:"1", d:myAddress(),
            e:2, f:false, g:"2", h:myAddress(),
            i:3, j:true, k:"3", l:myAddress(),
        };
    }
}
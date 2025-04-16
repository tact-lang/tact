struct Levels {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Slice?;
    j: Address?;
}

contract MixedOptionals {
    store: Levels;

    init() {
        self.store = Levels{
            a:1, b:true, c:"text", d:emptyCell().asSlice(), e:myAddress(),
            f:null, g:null, h:null, i:null, j:null
        };
    }
}
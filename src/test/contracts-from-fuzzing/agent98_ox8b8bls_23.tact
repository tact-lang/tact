struct S {
    a: Int; b: Int; c: Int; d: Int;
    e: Bool; f: String; g: String;
    h: Address; i: Cell; j: Slice;
}
contract LongStructFlat {
    s: S;
    init() {
        self.s = S{
            a:1,b:2,c:3,d:4,e:true,f:"a",g:"b",
            h:myAddress(),i:emptyCell(),j:emptyCell().asSlice()
        };
    }
}
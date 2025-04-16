struct FlatDeep {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Builder;
    m: String;
    n: String?;
}

contract TestContract {
    x: FlatDeep;

    init() {
        self.x = FlatDeep{
            a:1,b:true,c:"c",d:2,e:false,f:"f",g:myAddress(),h:myAddress(),i:emptyCell(),j:emptyCell(),k:emptyCell().asSlice(),l:beginCell(),m:"m",n:"n"
        };
    }
}
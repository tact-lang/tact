struct LargeComplexNested {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Address?;
    h: Cell?;
    i: Slice?;
    j: String?;
}

struct Second {
    nested: LargeComplexNested;
    x: Int;
    y: Bool;
}

contract ComplexNestedContract {
    state: Second;
    init() {
        self.state = Second{
            nested: LargeComplexNested{
                a:1,b:true,c:"x",d:emptyCell().asSlice(),e:emptyCell(),
                f:myAddress(),g:null,h:null,i:null,j:null
            },
            x:100,
            y:false
        };
    }
}
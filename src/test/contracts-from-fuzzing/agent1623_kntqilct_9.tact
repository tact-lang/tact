struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: Cell?;
    j: Slice?;
    k: Int?;
    l: Bool?;
    m: Address?;
    n: Cell?;
    o: Slice?;
}

contract ManyOptionalStorage {
    foo: ManyOptionals;
    
    init() {
        self.foo = ManyOptionals{
            a:10, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(),
            f:20, g:false, h:myAddress(), i:emptyCell(), j:emptyCell().asSlice(),
            k:30, l:true, m:myAddress(), n:emptyCell(), o:emptyCell().asSlice(),
        };
    }
}
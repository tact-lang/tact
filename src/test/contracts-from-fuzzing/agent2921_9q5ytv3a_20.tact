struct SingleOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract OnlyOptionals {
    val: SingleOptional;

    init(){
        self.val = SingleOptional{
            a: null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}
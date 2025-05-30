struct ManyOptsDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Slice? = null;
    d: Cell? = null;
    e: Address? = null;
    f: String? = null;
    g: Int = 3;
    h: Bool = true;
}

contract TestContract {
    val: ManyOptsDefaults;

    init() {
        self.val = ManyOptsDefaults{
            a:null,b:null,c:null,d:null,e:null,f:null,g:77,h:false
        };
    }
}
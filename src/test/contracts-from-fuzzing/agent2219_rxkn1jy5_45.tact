struct NestedDefaults {
    a: Int=1;
    b: Bool=true;
    c: String="str";
    d: Int?=null;
    e: Bool?=null;
    f: String?=null;
}

contract NestedDef {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{
            a:1,b:true,c:"str",d:null,e:null,f:null
        };
    }
}
struct ManyOptionDefaults {
    a: Int? = null;
    b: Int? = null;
    c: Int? = null;
    d: Int? = null;
}

contract OptDefaultsStruct {
    data: ManyOptionDefaults;

    init() {
        self.data = ManyOptionDefaults{
            a:null,b:null,c:null,d:null
        };
    }
}
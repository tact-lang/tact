struct InnerStruct {
    f1: Int;
    f2: Bool;
    f3: String?;
}

contract DeepOptionals {
    optInner: InnerStruct?;
    init() {
        self.optInner = InnerStruct{ f1:1,f2:true,f3:null };
    }
}

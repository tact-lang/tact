struct OptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    flag: Bool;
    txt: String;
}

contract TestContract {
    data: OptionalStruct = OptionalStruct{ inner: null };
    
    init() {
        self.data = OptionalStruct{
            inner: InnerStruct{ x:42, flag:true, txt:"hello" }
        };
    }
}

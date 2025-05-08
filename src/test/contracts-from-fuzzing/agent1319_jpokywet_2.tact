struct OptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalStructContract {
    data: OptionalStruct;
    
    init() {
        self.data = OptionalStruct{
            innerOpt: null
        };
    }
}

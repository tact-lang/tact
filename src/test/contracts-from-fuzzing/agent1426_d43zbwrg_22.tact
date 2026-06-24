struct OptionalStruct {
    opt: OptionalInner?;
}

struct OptionalInner {
    x: Int;
}

contract PersistOptStruct {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            opt: OptionalInner{ x:5 }
        };
    }
}
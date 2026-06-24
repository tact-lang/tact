struct OptInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainerOpt {
    inner: OptInStruct;
}

contract OptStructDefaults {
    obj: ContainerOpt;

    init() {
        self.obj = ContainerOpt{
            inner: OptInStruct{
                a:null, b:null, c:null
            }
        };
    }
}
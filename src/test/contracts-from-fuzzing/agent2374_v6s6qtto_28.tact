struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract StorageOpt {
    a: OptStruct?;

    init() {
        self.a = OptStruct{
            x:null,y:true,z:"ok"
        };
    }
}
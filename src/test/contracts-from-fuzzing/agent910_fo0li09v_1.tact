struct NestedOpt {
    a: Int?; 
    b: Bool?; 
}

struct DeepStruct {
    x: Int;
    y: Bool;
    z: NestedOpt;
}

contract DeepPersistent {
    data: DeepStruct;

    init() {
        self.data = DeepStruct{
            x: 1,
            y: true,
            z: NestedOpt{
                a: null,
                b: false,
            },
        };
    }
}
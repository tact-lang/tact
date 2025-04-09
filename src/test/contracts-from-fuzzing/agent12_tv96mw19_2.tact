struct OuterStruct {
    x: Int;
    y: InnerStruct; 
}

struct InnerStruct {
    flag: Bool;
    nestedOpt: Int?;
}

contract TestContract {
    info: OuterStruct;

    init() {
        self.info = OuterStruct{
            x: 10,
            y: InnerStruct{ flag: false, nestedOpt: null }
        };
    }
}
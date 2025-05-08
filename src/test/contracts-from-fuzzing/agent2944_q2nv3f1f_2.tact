struct DeepNested {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    x: Int;
    y: Bool;
    dz: DeepNested;
}

contract DeepStorage {
    persistent: OuterStruct;

    init() {
        self.persistent = OuterStruct{
            x: 5,
            y: true,
            dz: DeepNested{
                a: 10,
                b: false
            }
        };
    }
}
struct InnerStruct {
    a: Int;
    b: Bool = true;
    c: String?;
}

struct OuterStruct {
    x: InnerStruct;
    y: Int?;
    z: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            x: InnerStruct{
                a: 7,
                c: null
            },
            y: null,
            z: false
        };
    }
}
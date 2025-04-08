struct InnerData {
    x: Int?;
    y: Bool?;
}

struct MiddleData {
    a: InnerData?;
    b: Bool;
}

struct OuterData {
    m: MiddleData;
    z: Int;
}

contract OptionalDeepNesting {
    data: OuterData;

    init() {
        self.data = OuterData{
            m: MiddleData{
                a: null,
                b: false
            },
            z: 91
        };
    }
}
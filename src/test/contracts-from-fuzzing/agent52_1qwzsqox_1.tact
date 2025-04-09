struct DeepNested {
    a: Int;
    b: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
    z: SubInner;
}

struct SubInner {
    s: String;
    flag: Bool;
    num: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: InnerStruct{
                x: 2,
                y: null,
                z: SubInner{
                    s: "hello",
                    flag: true,
                    num: null
                }
            }
        };
    }
}

struct DeepNested {
    a: Int;
    b: Int?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: InnermostStruct;
}

struct InnermostStruct {
    z: Int?;
}

contract NestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            a: 1,
            b: null,
            c: InnerStruct{
                x: 2,
                y: InnermostStruct{
                    z: null
                }
            }
        };
    }
}
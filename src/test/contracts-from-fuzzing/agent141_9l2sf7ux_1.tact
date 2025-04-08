struct Container {
    nested: NestedStruct;
}

struct NestedStruct {
    deepValue: Int;
    deeper: DeeperStruct;
}

struct DeeperStruct {
    subfield: Bool;
}

contract DeepNestTest {
    container: Container;

    init() {
        self.container = Container{
            nested: NestedStruct{
                deepValue: 42,
                deeper: DeeperStruct{
                    subfield: true
                }
            }
        };
    }
}
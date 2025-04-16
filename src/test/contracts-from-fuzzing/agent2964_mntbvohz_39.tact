struct SubStruct {
    x: Int;
    y: Int;
}

struct ContainerStruct {
    content: SubStruct;
}

struct WrapContainer {
    inner: ContainerStruct;
}

contract TripleWrap {
    storage: WrapContainer;

    init() {
        self.storage = WrapContainer{
            inner: ContainerStruct{
                content: SubStruct{
                    x:1,
                    y:2
                }
            }
        };
    }
}
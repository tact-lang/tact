struct MultiLayers {
    level: Int;
    desc: String;
}

struct Container {
    data1: MultiLayers;
    data2: MultiLayers;
    flag: Bool;
}

contract ContainerOfStructs {
    container: Container;

    init() {
        self.container = Container{
            data1: MultiLayers{level:1, desc:"A"},
            data2: MultiLayers{level:2, desc:"B"},
            flag: false
        };
    }
}
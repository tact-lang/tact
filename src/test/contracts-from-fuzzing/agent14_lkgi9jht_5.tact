struct DeeplyNested {
    level1: Int;
    level2: Int?;
    level3: Bool;
    level4: String;
}

struct Container {
    info: DeeplyNested;
    status: Bool?;
    label: String;
}

contract TestContract {
    container: Container;

    init() {
        self.container = Container{
            info: DeeplyNested{
                level1: 1,
                level2: null,
                level3: false,
                level4: "L4",
            },
            status: null,
            label: "ok"
        };
    }
}
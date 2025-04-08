struct MultiLevelA {
    a: Int;
    b: String?;
}

struct MultiLevelB {
    x: Bool;
    y: MultiLevelA;
}

struct MultiLevelC {
    z: MultiLevelB;
}

contract NestedMultiLevel {
    root: MultiLevelC;

    init() {
        self.root = MultiLevelC{
            z: MultiLevelB{
                x: false,
                y: MultiLevelA{a:10,b:null}
            }
        };
    }
}
struct L2 {
    x: Int;
    y: Int;
}

struct L1 {
    arr1: L2;
    arr2: L2;
}

struct Root {
    layer1: L1;
    num: Int;
}

contract NestedTree {
    storage: Root;

    init() {
        self.storage = Root{
            layer1: L1{
                arr1: L2{x: 1, y: 2},
                arr2: L2{x: 3, y: 4},
            },
            num: 5
        };
    }
}
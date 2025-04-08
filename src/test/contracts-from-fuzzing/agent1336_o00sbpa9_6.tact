struct OptNestedPrims {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    num: Int;
    nestedOpt: OptNestedPrims?;
}

contract OptNestedStructs {
    val: Container;

    init() {
        self.val = Container{
            num: 100,
            nestedOpt: null
        };
    }

    receive() {
        let _ = self.val;
    }
}
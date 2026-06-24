struct InnerParam {
    a: Int;
    b: Bool?;
}

struct OuterParam {
    x: String;
    y: InnerParam;
    z: InnerParam?;
}

contract NestedParams(
    param: OuterParam,
) {
    receive() {
        dump(self.param.x);
    }
}

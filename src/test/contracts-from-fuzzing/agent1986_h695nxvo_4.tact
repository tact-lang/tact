struct NestedOpt {
    x: Int;
    y: Bool?;
}

contract NestedStructTest {
    data: NestedOpt = NestedOpt{ x:42, y: null };

    init() {
        self.data = NestedOpt{ x:7, y:true };
    }
}

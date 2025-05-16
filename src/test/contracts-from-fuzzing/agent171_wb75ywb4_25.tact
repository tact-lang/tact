struct NestedManyOpt {
    x: Int?;
    y: Bool?;
    z: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract NestedManyOptTest {
    data: NestedManyOpt;
    init() {
        self.data = NestedManyOpt{ x:null, y:null, z:null };
    }
}
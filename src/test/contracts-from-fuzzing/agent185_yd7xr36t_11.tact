struct DeepOptionals {
    o1: InnerOpt?;
    o2: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
    z: String?;
}

contract DeepOptTest {
    data: DeepOptionals;
    init() {
        self.data = DeepOptionals{
            o1: null,
            o2: InnerOpt{ x: 3, y: null, z: null }
        };
    }
}

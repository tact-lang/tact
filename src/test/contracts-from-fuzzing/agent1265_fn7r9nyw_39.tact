struct DeepNestedOpt {
    x: Int; 
    y: Int?; 
    z: InnerMostOpt?;
}

struct InnerMostOpt {
    val: Bool;
}

contract DeepOptTest {
    storage: DeepNestedOpt;

    init() {
        self.storage = DeepNestedOpt{ x:1, y:null, z:null };
    }
}
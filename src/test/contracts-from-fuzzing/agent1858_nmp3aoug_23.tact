struct NestedOptionals {
    a: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptTest {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{
            a: InnerOpt{ x:null, y:true } 
        };
    }
}
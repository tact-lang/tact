struct ChildA { g: Int; h: Bool?; }
struct ChildB { x: Int; y: String?; }

struct Container {
    ca: ChildA;
    cb: ChildB;
    d: Int?;
    s: String?;
}

contract DifferentNestedFieldsTest {
    val: Container;
    init() {
        self.val = Container{
            ca: ChildA{g:1,h:null},
            cb: ChildB{x:2,y:null},
            d: null,
            s: null
        };
    }
}

struct SInner {
    x: Int;
    y: Bool?;
}

struct SOuter {
    inn: SInner?;
}

contract TestContract {
    foo: SOuter;

    init() {
        self.foo = SOuter{inn: SInner{x:42,y:true}};
    }
}
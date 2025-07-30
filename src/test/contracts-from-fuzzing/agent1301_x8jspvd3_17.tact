struct Param1 {
    a: Int;
    b: OptionalInner; 
}

struct OptionalInner {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    p: Param1;
    init() {
        self.p = Param1{ a: 21, b: OptionalInner{ x:null, y:true } };
    }
}
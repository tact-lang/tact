struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    x: StructA;
    y: StructA;
}

contract TestMultiSame {
    data: StructB;

    init() {
        self.data = StructB{
            x: StructA{a:1,b:true},
            y: StructA{a:2,b:false}
        };
    }

    receive() {
        let tmp = self.data;
    }
}
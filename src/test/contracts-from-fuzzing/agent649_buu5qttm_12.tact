struct A {
    x: Int;
    y: Bool;
}

struct B {
    z: Int;
    a: A;
}

contract StructInStruct {
    b: B = B{
        z: 1,
        a: A{
            x:2,
            y:true
        }
    };
    receive() {
        let _ = self.b.a.y;
    }
}
struct A {
    x: Int;
    y: Int;
    z: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
}

struct B {
    text: String;
    someInt: Int;
    innerA: A;
}

contract StructWithinStruct {
    field: B;
    init() {
        self.field = B{
            text: "abc",
            someInt: 7,
            innerA: A{
                x:1, y:2, z:3, a1:4, a2:5, a3:6, a4:7, a5:8, a6:9
            }
        };
    }
}
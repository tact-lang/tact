struct A { x: Int; y: Int; z: Int }
struct B { s1: A; s2: A; s3: A }

contract MultipleStructs {
    data: B;
    init() {
        self.data = B{
            s1: A{ x:1, y:2, z:3 },
            s2: A{ x:4, y:5, z:6 },
            s3: A{ x:7, y:8, z:9 },
        };
    }
}
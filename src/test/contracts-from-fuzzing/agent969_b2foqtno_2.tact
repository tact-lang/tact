struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    z: Inner?;
}

contract NestTest {
    myData: Outer;

    init() {
        self.myData = Outer{
            z: Inner{
                x: 12,
                y: null
            }
        };
    }
}

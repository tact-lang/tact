struct WeirdNest {
    x: Int;
    y: Inner1;
}

struct Inner1 {
    z: Inner2?;
}

struct Inner2 {
    w: Inner3?;
}

struct Inner3 {
    flag: Bool?;
    num: Int;
}

contract WeirdTest {
    data: WeirdNest;

    init() {
        self.data = WeirdNest{
            x: 1,
            y: Inner1{
                z: Inner2{
                    w: Inner3{
                        flag: null,
                        num: 42
                    }
                }
            }
        };
    }
}
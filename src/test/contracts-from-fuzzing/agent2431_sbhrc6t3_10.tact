struct SS1 {
    a: Int as int8;
    b: Bool?;
}

struct SS2 {
    x: SS1;
    y: Int as uint16;
}

contract SerialNest {
    s: SS2;

    init() {
        self.s = SS2{
            x: SS1{
                a: 5,
                b: null
            },
            y: 42
        };
    }
}
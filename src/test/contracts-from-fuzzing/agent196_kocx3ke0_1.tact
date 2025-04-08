struct Inner {
    xi: Int;
    yi: Int?;
}

struct Outer {
    inn: Inner;
    yi: Int?;
}

contract DeepOptionalTest {
    point: Outer;

    init() {
        self.point = Outer{
            inn: Inner{xi: 1, yi: null},
            yi: null
        };
    }
}

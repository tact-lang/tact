struct NestedStructLevel2 {
    a: Int;
    b: Bool?;
    c: String;
}

struct NestedStructLevel1 {
    x: Int;
    y: NestedStructLevel2;
    z: Int?;
}

contract TestContract {
    data: NestedStructLevel1;

    init() {
        self.data = NestedStructLevel1{
            x: 1,
            y: NestedStructLevel2{
                a: 2,
                b: true,
                c: "hello",
            },
            z: null,
        };
    }
}
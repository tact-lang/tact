struct NestedManyLayers {
    v1: Int;
    inner1: Inner1;
}

struct Inner1 {
    inner2: Inner2;
    b: Bool;
}

struct Inner2 {
    txt: String;
    inner3: Inner3;
}

struct Inner3 {
    flag: Bool?;
    number: Int;
}

contract ManyLayersTest {
    field: NestedManyLayers;

    init() {
        self.field = NestedManyLayers{
            v1: 1,
            inner1: Inner1{
                inner2: Inner2{
                    txt: "abc",
                    inner3: Inner3{
                        flag: null,
                        number: 42
                    }
                },
                b: true,
            },
        };
    }
}

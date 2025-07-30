struct Inner1 {
    a: Int;
}

struct Inner2 {
    inner1: Inner1;
}

struct Inner3 {
    inner2: Inner2;
}

contract NestedLayers {
    value: Inner3;

    init() {
        self.value = Inner3 {
            inner2: Inner2{
                inner1: Inner1{
                    a: 11,
                }
            }
        };
    }
}
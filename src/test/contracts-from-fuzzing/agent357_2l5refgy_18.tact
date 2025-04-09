struct MultipleNestedLayers {
    a: Inner1;
    b: Int;
}

struct Inner1 {
    a: Int;
    b: Inner2;
}

struct Inner2 {
    x: Int;
    y: Bool?;
    z: Inner3?;
}

struct Inner3 {
    k: Int;
    flag: Bool;
}

contract TestContract {
    data: MultipleNestedLayers;

    init() {
        self.data = MultipleNestedLayers{
            a: Inner1{
                a:1,
                b: Inner2{
                    x:2,
                    y:null,
                    z:null
                }
            },
            b: 99
        };
    }
}
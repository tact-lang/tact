struct Nested1 {
    x: Int;
    y: Bool?;
}

struct Nested2 {
    z: String;
    n1: Nested1;
}

struct Nested3 {
    a: Int;
    n2: Nested2;
    opt: Int?;
}

contract DeepPersist {
    data: Nested3;

    init() {
        self.data = Nested3{
            a: 10,
            n2: Nested2{
                z: "nested",
                n1: Nested1{x:1,y:null}
            },
            opt: null
        };
    }
}
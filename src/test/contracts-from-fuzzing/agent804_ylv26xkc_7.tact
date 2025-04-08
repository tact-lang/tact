struct MultiNested {
    a: Int;
    b: Inner1;
    c: Inner2;
}

struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Inner3;
}

struct Inner3 {
    z: String?;
}

contract TestContract {
    storage: MultiNested;
    init() {
        self.storage = MultiNested{
            a: 1,
            b: Inner1{
                x: 2
            },
            c: Inner2{
                y: Inner3{
                    z: "nested"
                }
            }
        };
    }
}
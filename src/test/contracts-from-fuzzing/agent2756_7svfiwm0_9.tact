struct Inner1 {
    x: Int;
    y: Int;
}

struct Inner2 {
    z: Inner1;
    b: Bool;
}

struct Inner3 {
    a: Int?;
    inner2: Inner2?;
}

contract MixNestedOptional {
    field: Inner3;

    init() {
        self.field = Inner3{
            a: null,
            inner2: null
        };
    }
}
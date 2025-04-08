struct DeepFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct MiddleFields {
    x: DeepFields;
    y: DeepFields;
}

contract ManyDeepFields {
    m: MiddleFields;

    init() {
        self.m = MiddleFields{
            x: DeepFields{a:1,b:2,c:3,d:4,e:5},
            y: DeepFields{a:6,b:7,c:8,d:9,e:10}
        };
    }
}
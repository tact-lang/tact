struct InnerA {
    one: Int;
    two: Bool;
}

struct InnerB {
    x: String;
    y: Int?;
}

struct OuterA {
    inner: InnerA;
    flag: Bool;
}

struct OuterB {
    inner: InnerB;
    text: String;
}

contract TwoDifferentStructs {
    a: OuterA;
    b: OuterB;

    init() {
        self.a = OuterA{
            inner: InnerA{one:1,two:true},
            flag: false
        };
        self.b = OuterB{
            inner: InnerB{x:"abc", y: null},
            text: "hello"
        };
    }
}
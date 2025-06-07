struct Sub1 {
    a: Int;
    b: Bool;
}

struct Sub2 {
    x: Int;
    y: Bool;
}

struct MultiNested {
    f1: Sub1;
    f2: Sub2;
    s: String;
}

contract TestContract {
    container: MultiNested;
    init() {
        self.container = MultiNested{
            f1: Sub1{a: 123, b: true},
            f2: Sub2{x: 456, y: false},
            s: "combo"
        };
    }
}
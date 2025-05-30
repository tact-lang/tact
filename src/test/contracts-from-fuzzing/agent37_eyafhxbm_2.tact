struct S {
    amount: Int;
    name: String;
    enabled: Bool;
}

struct Outer {
    s: S;
    info: String;
}

contract TestContract {
    data: Outer = Outer{
        s: S{amount: 5, name: "abc", enabled: true},
        info: "hello"
    };

    init() {
        self.data = Outer{
            s: S{amount: 100, name: "xyz", enabled: false},
            info: "world"
        };
    }
    receive() {}
}
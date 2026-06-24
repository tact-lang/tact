struct Inner {
    n: Int;
}

struct Outer1 {
    inner: Inner;
    name: String;
}

struct Outer2 {
    first: Outer1;
    second: Outer1;
    flag: Bool;
}

contract DeepMultiple{
    state: Outer2;

    init() {
        self.state = Outer2{
            first: Outer1{ inner: Inner{n:1}, name:"A" },
            second: Outer1{ inner: Inner{n:2}, name:"B" },
            flag: true
        };
    }
}
struct Inner {
    flag: Bool;
    note: String;
}

struct Outer {
    description: String;
    opt_inner: Inner?;
}

contract TestContract {
    metadata: Outer;

    init() {
        self.metadata = Outer{
            description: "test",
            opt_inner: Inner{flag: false, note: "nested"},
        };
    }
}
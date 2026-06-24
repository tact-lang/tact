struct Inner {
    optInt: Int?;
    text: String;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    state: Outer = Outer{
        nested: Inner{optInt: null, text: "hi"},
        flag: true
    };
    receive() {
        let _ = self.state;
    }
}
struct Inner {
    flag: Bool;
    count: Int?;
}

struct Outer {
    nested: Inner;
    label: String;
}

contract TestContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            nested: Inner{flag: true, count: 7},
            label: "test"
        };
    }
}
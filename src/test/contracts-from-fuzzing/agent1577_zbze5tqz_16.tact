struct Inner {
    a: Int;
    b: Bool;
}

message(88) Middle {
    inside: Inner;
    label: String;
}

struct Outer {
    wrap: Middle;
    flag: Bool?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            wrap: Middle{
                inside: Inner{a: 5, b: true},
                label: "test"
            },
            flag: null
        };
    }
}
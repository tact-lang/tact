struct Inner {
    enabled: Bool;
    threshold: Int?;   
}

struct Outer {
    inner: Inner;
    description: String;
}

contract DeepOptional {
    outer: Outer = Outer{
        inner: Inner{enabled: true, threshold: null},
        description: "test"
    };

    init() {
        self.outer = Outer{
            inner: Inner{enabled: false, threshold: 100},
            description: "changed"
        };
    }
}
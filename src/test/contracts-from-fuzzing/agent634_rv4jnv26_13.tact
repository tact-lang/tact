// Very deeply nested optional and default-value test
struct InnerMost {
    value: Int?;
}

struct MidLevel {
    inner: InnerMost?;
    flag: Bool = false;
}

struct OuterLevel {
    mid: MidLevel?;
    label: String = "foo";
}

contract DeepOptionals {
    deepOptional: OuterLevel;
    
    init() {
        self.deepOptional = OuterLevel{mid: null, label: "bar"};
    }
}
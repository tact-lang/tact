contract DeepNestedOptional {
    st: Outer?;

    init() {
        self.st = Outer{
            level: Inner{
                num: 100,
                text: "abc"
            }
        };
    }
}

struct Outer { level: Inner; }
struct Inner {
    num: Int;
    text: String?;
}

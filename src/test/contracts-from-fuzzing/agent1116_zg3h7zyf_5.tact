struct Inner {
    intVal: Int;
    optBool: Bool?;
}

struct Outer {
    outerInt: Int;
    nested: Inner;
    optString: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            outerInt: 50,
            nested: Inner{
                intVal: 100,
                optBool: true
            },
            optString: "Nested"
        };
    }
}
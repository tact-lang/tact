// Very long contract with many fields, deep nesting, optional, defaults
struct DeepNested {
    a: Int?;
    b: Bool? = null;
    c: String;
}

struct Combo {
    x: DeepNested;
    y: DeepNested?;
    f: Bool;
}

contract ComplexDeploy {
    data: Combo;
    init() {
        self.data = Combo{
            x: DeepNested{ a:1, b:true, c:"x" },
            y: null,
            f: false
        };
    }
}
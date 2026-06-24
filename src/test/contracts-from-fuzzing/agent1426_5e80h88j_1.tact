struct DeepNested {
    x: Int;
    y: Bool;
}

struct Outer {
    foo: DeepNested;
    bar: DeepNested;
}

contract TestStorage {
    s: Outer;

    init() {
        self.s = Outer{
            foo: DeepNested{ x:1, y:true },
            bar: DeepNested{ x:2, y:false },
        };
    }
}
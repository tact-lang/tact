struct Inner {
    a: Int;
    b: Bool?;
    name: String;
}

struct Outer {
    one: Inner;
    two: Inner;
    flag: Bool;
}

contract NestedMultiple {
    data: Outer;

    init() {
        self.data = Outer{
            one: Inner{ a:1, b:true, name:"x" },
            two: Inner{ a:2, b:null, name:"y" },
            flag: true
        };
    }
}

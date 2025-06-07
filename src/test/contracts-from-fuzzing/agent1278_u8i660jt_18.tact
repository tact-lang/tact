struct Inner {
    a: Int;
    b: Bool?;
    c: String?;
}

struct Outer {
    one: Inner;
    two: Inner;
}

contract MultipleNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            one: Inner{ a:1, b:null, c:null },
            two: Inner{ a:2, b:true, c:null }
        };
    }
}
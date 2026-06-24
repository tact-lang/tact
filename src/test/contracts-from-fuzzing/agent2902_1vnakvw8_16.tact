// deeply nested optional inside a struct with mix
struct InnerMost {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Middle {
    one: InnerMost;
    two: InnerMost;
}

struct Outer {
    m: Middle;
    x: Int;
    y: String;
}

contract TestContract {
    value: Outer;

    init() {
        self.value = Outer{
            m: Middle{
                one: InnerMost{ a:null, b:true, c:null },
                two: InnerMost{ a:123, b:null, c:"hi" },
            },
            x: 99,
            y: "done",
        };
    }
}
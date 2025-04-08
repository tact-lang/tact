struct InnerMost {
    a: Int;
    b: Bool?;
}
struct Inner1 {
    m: InnerMost;
}
struct Inner2 {
    m: InnerMost;
}
struct Outer {
    x: Inner1?;
    y: Inner2?;
    flag: Bool;
    note: String;
}
contract TestContract {
    state: Outer;
    init() {
        self.state = Outer{
            x: Inner1{m: InnerMost{a:5, b:true}},
            y: null,
            flag: false,
            note: "deep"
        };
    }
}
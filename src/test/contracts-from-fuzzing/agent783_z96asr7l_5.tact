struct DeepInner {
    flag: Bool;
    label: String;
}

struct Middle {
    din: DeepInner;
    count: Int;
}

struct Outer {
    m: Middle;
    opt: Bool?;
    remarks: String;
}

contract ComplexStructTest {
    state: Outer;

    init() {
        self.state = Outer{
            m: Middle{ din: DeepInner{ flag:true, label:"x" }, count: 2 },
            opt: null,
            remarks: "done"
        };
    }
}
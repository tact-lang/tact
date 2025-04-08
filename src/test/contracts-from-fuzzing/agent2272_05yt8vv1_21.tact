struct InnerMost {
    a: Int;
    b: Bool;
    c: String;
}

struct Middle {
    i: InnerMost;
    j: Int?;
}

struct Outer {
    m: Middle;
    flag: Bool;
    text: String?;
}

contract MegaMix {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{ i: InnerMost{ a:1, b:true, c:"x" }, j:null },
            flag:false, text:null
        };
    }
}
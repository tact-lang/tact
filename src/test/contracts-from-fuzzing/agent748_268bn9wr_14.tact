struct InnerMost {
    z: Bool;
    data: String?;
}

struct Middle {
    m: Int;
    inner: InnerMost;
}

struct OuterMost {
    title: String;
    nest: Middle;
}

contract MultiNestedStructs {
    rec: OuterMost;

    init() {
        self.rec = OuterMost{
            title: "Start",
            nest: Middle{
                m: 777,
                inner: InnerMost{
                    z: true,
                    data: "payload",
                }
            }
        };
    }
}

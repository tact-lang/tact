struct InnerMost {
    x: Int = 5;
    y: Bool?;
}

struct Inner2 {
    nested: InnerMost;
    s: String = "hi";
}

struct OuterMost {
    nested: Inner2;
    flag: Bool = false;
}

contract TestContract {
    state: OuterMost = OuterMost{
        nested: Inner2{
            nested: InnerMost{
                x: 5,
                y: null
            },
            s: "hi"
        },
        flag: false
    };

    init() {
        self.state = OuterMost{
            nested: Inner2{
                nested: InnerMost{
                    x:5,
                    y:null
                },
                s:"hi"
            },
            flag: false
        };
    }
}
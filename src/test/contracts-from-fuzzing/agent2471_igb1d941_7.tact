struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle1 {
    im: InnerMost;
}

struct Middle2 {
    m1: Middle1;
}

struct Middle3 {
    m2: Middle2;
}

struct TopStruct {
    m3: Middle3;
}

contract DeepContract {
    top: TopStruct;

    init() {
        self.top = TopStruct{
            m3: Middle3{
                m2: Middle2{
                    m1: Middle1{
                        im: InnerMost{
                            a: 5,
                            b: true,
                        },
                    },
                },
            },
        };
    }
}
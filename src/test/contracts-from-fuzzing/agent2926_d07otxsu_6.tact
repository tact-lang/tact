struct SubInner {
    a: Int?;
    b: Bool?;
}

struct Middle {
    m: Int;
    n: SubInner;
}

contract DeepInit {
    state: Middle;

    init() {
        self.state = Middle{
            m: 100,
            n: SubInner{
                a: 5,
                b: null
            }
        };
    }
}
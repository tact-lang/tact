struct InnerMost {
    flag: Bool = true;
}

struct Middle {
    inside: InnerMost;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            inside: InnerMost{}
        };
    }
}
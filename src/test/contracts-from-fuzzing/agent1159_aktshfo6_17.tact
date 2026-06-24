struct MultiNested {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    s: SuperInner?;
}

struct SuperInner {
    id: Int;
    text: String;
}

contract TestContract {
    mn: MultiNested;

    init() {
        self.mn = MultiNested{
            innerOpt: Inner{
                s: SuperInner{
                    id: 12345,
                    text: "deep nested"
                }
            },
            flag: false
        };
    }
}
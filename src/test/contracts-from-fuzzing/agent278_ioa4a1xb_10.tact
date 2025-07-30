struct SubInner {
    flag: Bool;
    name: String;
}

struct Inner {
    number: Int;
    sub: SubInner;
}

contract NestedComposite {
    data: Inner;
    init() {
        self.data = Inner{
            number: 1024,
            sub: SubInner{
                flag: true,
                name: "nested"
            }
        };
    }
}
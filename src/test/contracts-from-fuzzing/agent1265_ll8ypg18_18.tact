struct Outer {
    str: String;
    sub: SubInner;
}

struct SubInner {
    optionalStr: String?;
    flag: Bool;
    number: Int;
}

contract DeepOptionalStorage {
    data: Outer;

    init() {
        self.data = Outer{
            str: "Root",
            sub: SubInner{
                optionalStr: null,
                flag: true,
                number: 42,
            },
        };
    }
}
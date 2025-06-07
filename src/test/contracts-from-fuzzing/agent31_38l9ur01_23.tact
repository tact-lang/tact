struct ManyNestedOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
    sub: SubOptions?;
}

struct SubOptions {
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: ManyNestedOptionals;

    init() {
        self.data = ManyNestedOptionals{
            x: null,
            y: null,
            z: null,
            sub: SubOptions{
                flag: null,
                text: null,
            },
        };
    }
}

struct ManyNestedOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterManyOpt {
    x: ManyNestedOptions?;
    y: Int;
}

contract OptionalsContract {
    data: OuterManyOpt;

    init() {
        self.data = OuterManyOpt{
            x: ManyNestedOptions{
                a: 5,
                b: null,
                c: "yo"
            },
            y: 7
        };
    }
}
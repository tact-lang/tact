struct MoreOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOptions {
    m: MoreOptions;
}

contract OptionsInDepth {
    out: OuterOptions;

    init() {
        self.out = OuterOptions{
            m: MoreOptions{
                a: null,
                b: true,
                c: null
            }
        };
    }
}
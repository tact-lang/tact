// Now attempt large optional struct initialized partially
struct BigOpt {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: String?;
}

contract LargeOptPartial {
    val: BigOpt;

    init() {
        self.val = BigOpt{
            a: 1,
            d: null,
            g: "hi"
        };
    }
}
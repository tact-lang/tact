struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract OptStorage {
    myData: OptionalNest;

    init() {
        self.myData = OptionalNest{
            a: null,
            b: true,
            c: InnerOpt{
                x: null,
                y: "hello"
            }
        };
    }
}
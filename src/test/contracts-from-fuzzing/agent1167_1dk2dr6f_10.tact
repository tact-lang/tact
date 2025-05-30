// test a contract with only nested optional struct as field
struct InnerOpt {
    foo: Int?;
    bar: Bool?;
    name: String?;
}

contract Test10 {
    nestedOpt: InnerOpt?;

    init() {
        self.nestedOpt = null;
    }
}
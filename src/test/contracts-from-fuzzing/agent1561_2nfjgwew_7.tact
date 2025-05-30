struct Optionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    innerOpt: Inner?;
}

struct Inner {
    a: Int;
    b: String;
}

contract OnlyOptionalsTest {
    state: Optionals;

    init() {
        self.state = Optionals{
            intOpt:null,
            boolOpt:null,
            strOpt:null,
            innerOpt:null
        };
    }
}
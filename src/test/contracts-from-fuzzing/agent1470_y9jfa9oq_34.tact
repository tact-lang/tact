// optional of a struct with optionals
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OuterWrap {
    container: InnerOpt?;

    init() {
        self.container = InnerOpt{a:null, b:true};
    }
}
struct OptionalNested {
    opt1: Int?;
    opt2: String?;
}

struct Container {
    fixed: Int;
    nest: OptionalNested?;
}

contract OptInOpt {
    c: Container;
    init() {
        self.c = Container{
            fixed: 42,
            nest: OptionalNested{opt1:null, opt2:"abc"}
        };
    }
}
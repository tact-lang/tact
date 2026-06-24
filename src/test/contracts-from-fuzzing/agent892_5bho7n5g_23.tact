struct Container {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract OptionalContainer {
    c: Container?;

    init() {
        self.c = Container{intOpt:5,boolOpt:null,stringOpt:"test"};
    }
}
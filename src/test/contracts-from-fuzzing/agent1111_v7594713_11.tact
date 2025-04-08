struct EmptyOpt {
    a: Int?;
    b: Bool?;
}

contract NestedDefault {
    e: EmptyOpt;

    init() {
        self.e = EmptyOpt{a:null,b:null};
    }
}
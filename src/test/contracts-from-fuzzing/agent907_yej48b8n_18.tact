struct HasStringOpt {
    a: String?;
    b: String?;
}

contract OptStringsInState {
    st: HasStringOpt;

    init() {
        self.st = HasStringOpt{a:null,b:null};
    }
}
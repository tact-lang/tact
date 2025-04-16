struct SingleOptional {
    a: Int?;
}

contract OnlyOptional {
    state: SingleOptional;

    init() {
        self.state = SingleOptional{a:null};
    }
}

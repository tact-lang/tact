struct Boo {
    opt: Bool?;
}

contract BoolOptionals {
    bo: Boo;

    init() {
        self.bo = Boo{ opt: true };
    }
}
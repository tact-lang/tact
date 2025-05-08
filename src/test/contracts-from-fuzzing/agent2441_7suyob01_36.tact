struct Sopt {
    foo: Int?;
}

contract ManyOptFields {
    opt1: Sopt?;
    opt2: Sopt?;
    opt3: Sopt?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }
}
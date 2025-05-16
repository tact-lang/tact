struct S1 {
    a: Int;
    b: Bool;
}

contract ManyOptionalStructs {
    opt1: S1?;
    opt2: S1?;
    opt3: S1?;
    opt4: Int?;
    opt5: Bool?;

    init() {
        self.opt1 = null;
        self.opt2 = S1{a:1, b:true};
        self.opt3 = null;
        self.opt4 = 10;
        self.opt5 = null;
    }

    receive() {
        if (self.opt2 != null) {
            let _ = self.opt2!!.a;
        }
    }
}
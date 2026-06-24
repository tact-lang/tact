struct Opti {
    s: SubOpt?;
}

struct SubOpt {
    b: Bool?;
    text: String;
}

contract OptionalNest {
    val: Opti?;

    init() {
        self.val = Opti { s: SubOpt { b:true, text: "abc" } };
    }
}
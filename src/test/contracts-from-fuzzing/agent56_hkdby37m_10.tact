struct S {
    one: Int;
    two: Bool;
    three: String?;
}

contract DefaultValues {
    s: S;

    init() {
        self.s = S{ one:1, two:true, three:null };
    }
}
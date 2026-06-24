struct Varied {
    i: Int;
    b: Bool;
    s: String;
}

contract VariedContract {
    st: Varied;

    init() {
        self.st = Varied{
            i:123, b:true, s:"abc"
        };
    }
}
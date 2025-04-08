struct Combo {
    i: Int;
    s: String?;
    b: Bool;
}

contract TestContract {
    field: Combo;

    init() {
        self.field = Combo{
            i:5,
            s:null,
            b:false
        };
    }
}
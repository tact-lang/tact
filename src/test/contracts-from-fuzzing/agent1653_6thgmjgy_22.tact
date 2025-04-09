struct Leaf {
    x: Int;
    msg: String;
}

struct Middle {
    leafOpt: Leaf?;
    b: Bool;
}

struct High {
    midOpt: Middle?;
    note: String;
}

contract TestContract {
    data: High;

    init() {
        self.data = High{
            midOpt: null,
            note: "highest"
        };
    }
}
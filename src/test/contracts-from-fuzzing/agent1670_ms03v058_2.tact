struct Params {
    s: String;
    n: Int?;
    flag: Bool;
}

contract TestOptional {
    data: Params;
    init() {
        self.data = Params{
            s: "hi",
            n: null,
            flag: true
        };
    }
}

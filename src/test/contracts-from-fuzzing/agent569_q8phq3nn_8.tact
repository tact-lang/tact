struct Params {
    a: Int;
    b: Bool;
    s: String;
    optA: Int?;
    optB: Bool?;
    optS: String?;
}

contract TestContract {
    val: Params;

    init() {
        self.val = Params{
            a: 1,
            b: true,
            s: "yo",
            optA: null,
            optB: null,
            optS: "hi"
        };
    }
}
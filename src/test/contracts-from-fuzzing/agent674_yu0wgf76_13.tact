struct Mix {
    i: Int;
    b: Bool?;
    s: String;
    c: Cell?;
    a: Address;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            i: 1,
            b: null,
            s: "Hi",
            c: null,
            a: myAddress(),
        };
    }
}
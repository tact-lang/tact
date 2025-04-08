// contract with mix of everything
struct Mix {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{
            a: 1,
            b: null,
            c: "hello",
            d: null,
            e: true,
            f: null
        };
    }
}
struct Inner1 { a: Int }
struct Inner2 { b: Bool }

struct Outmost {
    f1: Inner1;
    f2: Inner2;
    flag: Bool;
    data: String;
}

contract MultiStructFields {
    s: Outmost;

    init() {
        self.s = Outmost{
            f1: Inner1{ a: 3 },
            f2: Inner2{ b: true },
            flag: false,
            data: "hi"
        };
    }
}

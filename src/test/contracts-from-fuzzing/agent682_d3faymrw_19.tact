struct Inner {
    i: Int;
    o: Outer?;
}

struct Outer {
    j: Int;
    s: String;
}

contract TestContract {
    inn: Inner;

    init() {
        self.inn = Inner{
            i: 1,
            o: Outer{
                j: 22,
                s: "test"
            }
        };
    }
}
struct Wrapper {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Inner2 {
    d: Address;
    e: Cell;
    f: Int?;
}

contract TestContract {
    big: Wrapper;

    init() {
        self.big = Wrapper{
            inner1: Inner1{
                a: 1,
                b: true,
                c: "X"
            },
            inner2: Inner2{
                d: myAddress(),
                e: emptyCell(),
                f: null
            }
        };
    }
}
struct Outer {
    a: Int;
    inner1: Inner1;
}

struct Inner1 {
    b: Bool;
    inner2: Inner2;
}

struct Inner2 {
    c: String;
    inner3: Inner3;
}

struct Inner3 {
    d: Bool;
    inner4: Inner4;
}

struct Inner4 {
    e: Int;
}

contract ChainStructs {
    data: Outer;
    init() {
        self.data = Outer{
            a: 0,
            inner1: Inner1{
                b: true,
                inner2: Inner2{
                    c: "hi",
                    inner3: Inner3{
                        d: false,
                        inner4: Inner4{
                            e: 999,
                        }
                    }
                }
            }
        };
    }
}
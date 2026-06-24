struct Inner1 {
    x: Int?;
    y: Bool;
}

struct Inner2 {
    s: String;
    flag: Bool?;
}

struct Outer {
    a: Inner1;
    b: Inner2;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner1{
                x: null,
                y: true
            },
            b: Inner2{
                s: "string",
                flag: null
            }
        };
    }
}

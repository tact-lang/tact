struct Mid {
    m: Int;
    n: String;
}

struct Wrap1 {
    a: Mid;
    b: String;
}

struct Wrap2 {
    x: Wrap1;
    y: Int;
}

contract NestedWrap {
    data: Wrap2;
    
    init() {
        self.data = Wrap2{
            x: Wrap1{
                a: Mid{
                    m: 5,
                    n: "hi"
                },
                b: "test"
            },
            y: 7
        };
    }
}

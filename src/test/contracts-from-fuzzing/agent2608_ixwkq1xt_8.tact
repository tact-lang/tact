struct ComplexNested {
    first: Int;
    second: MiddleLayer;
    third: Int;
}

struct MiddleLayer {
    a: Int;
    b: InnerLayer;
    c: Bool;
}

struct InnerLayer {
    m: Int;
    n: String;
    o: Bool?;
    p: Address?;
}

contract TestContract {
    val: ComplexNested;

    init() {
        self.val = ComplexNested{
            first: 10,
            second: MiddleLayer{
                a: 20,
                b: InnerLayer{
                    m:30,
                    n:"hi",
                    o:true,
                    p:null
                },
                c: false
            },
            third: 40
        };
    }
}

struct Layer1 {
    second: Layer2;
}

struct Layer2 {
    third: Layer3;
}

struct Layer3 {
    fourth: Layer4;
}

struct Layer4 {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract Test {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            second: Layer2{
                third: Layer3{
                    fourth: Layer4{
                        a: 5,
                        b: null,
                        c: "str",
                        d: null
                    }
                }
            }
        };
    }
}
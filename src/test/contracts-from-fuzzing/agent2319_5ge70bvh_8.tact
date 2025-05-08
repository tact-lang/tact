struct Layer3 {
    code: String?;
    amount: Int?;
}

struct Layer2 {
    inner: Layer3;
    count: Int;
}

struct Layer1 {
    desc: String;
    sub: Layer2;
}

contract TestContract {
    nestedStuff: Layer1;

    init() {
        self.nestedStuff = Layer1{
            desc: "multi level",
            sub: Layer2{
                inner: Layer3{
                    code: null,
                    amount: 777,
                },
                count: 3,
            },
        };
    }
}

struct InnerLevel3 {
    d: Int = 3;
}

struct InnerLevel2 {
    c: InnerLevel3;
}

struct InnerLevel1 {
    b: InnerLevel2;
}

contract TestContract {
    a: InnerLevel1;

    init() {
        self.a = InnerLevel1{
            b: InnerLevel2{
                c: InnerLevel3{
                    d: 42,
                },
            },
        };
    }
}
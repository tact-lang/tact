struct InnerMost {
    value: Int;
}

struct SecondLevel {
    inner: InnerMost?;
    note: String?;
}

struct ThirdLevel {
    level2: SecondLevel?;
    flag: Bool?;
}

struct TopLevel {
    third: ThirdLevel?;
    count: Int?;
}

contract Test {
    data: TopLevel?;

    init() {
        self.data = TopLevel{
            third: ThirdLevel{
                level2: SecondLevel{
                    inner: InnerMost{ value: 123 },
                    note: "hi"
                },
                flag: true
            },
            count: 7
        };
    }

    receive() { return; }
}

struct BigNested {
    one: Layer1;
    two: Layer1;
}

struct Layer1 {
    deep: Layer2;
    label: String;
}

struct Layer2 {
    deeper: Layer3;
    flag: Bool;
}

struct Layer3 {
    number: Int;
    optionalText: String?;
}

contract TestBigNested {
    state: BigNested;

    init() {
        self.state = BigNested{
            one: Layer1{
                deep: Layer2{
                    deeper: Layer3{
                        number: 5,
                        optionalText: null
                    },
                    flag: true
                },
                label: "first"
            },
            two: Layer1{
                deep: Layer2{
                    deeper: Layer3{
                        number: 10,
                        optionalText: "hi"
                    },
                    flag: false
                },
                label: "second"
            }
        };
    }
}

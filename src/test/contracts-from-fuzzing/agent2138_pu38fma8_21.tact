struct Step1 {
    a: Int?;
    b: Bool?;
}

struct Step2 {
    c: Step1;
    d: Int?;
}

struct Step3 {
    e: Step2?;
    f: Bool;
}

contract DeeplyNestedOptional {
    root: Step3;

    init() {
        self.root = Step3{
            e: Step2{
                c: Step1{
                    a: 5,
                    b: null,
                },
                d: null,
            },
            f: true,
        };
    }
}
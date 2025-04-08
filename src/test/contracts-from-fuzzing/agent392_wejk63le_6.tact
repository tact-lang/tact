struct Step3 {
    val: Int;
}

struct Step2 {
    nested: Step3?;
}

struct Step1 {
    nested: Step2?;
}

contract TestContract {
    deepOpt: Step1;

    init() {
        self.deepOpt = Step1{
            nested: Step2{
                nested: Step3{
                    val: 42,
                },
            },
        };
    }
}
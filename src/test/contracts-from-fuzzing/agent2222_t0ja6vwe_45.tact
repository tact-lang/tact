struct Step3 { v: Int; }
struct Step2 { s3: Step3; }
struct Step1 { s2: Step2; }
contract Test {
    s: Step1;
    init() {
        self.s = Step1{ s2: Step2{ s3: Step3{ v: 7 } } };
    }
}
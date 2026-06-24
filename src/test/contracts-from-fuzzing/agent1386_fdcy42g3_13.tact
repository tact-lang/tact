struct Step1 {x: Int;}
struct Step2 {step1: Step1; y: Int;}
struct Step3 {step2: Step2; z: Int;}

contract Mixed {
    s: Step3;
    init() {
        self.s = Step3{ step2: Step2{ step1: Step1{ x: 1 }, y: 2 }, z: 3 };
    }
}
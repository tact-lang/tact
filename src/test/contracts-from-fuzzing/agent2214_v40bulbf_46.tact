struct Step1 { a: Int; }
struct Step2 { b: Step1; }
struct Step3 { c: Step2; }
struct Step4 { d: Step3; }
struct Step5 { e: Step4; }
struct Step6 { f: Step5; }

contract SuperDeep {
    val: Step6;
    init() {
        self.val = Step6{f: Step5{e: Step4{d: Step3{c: Step2{b: Step1{a:777}}}}}};
    }
}
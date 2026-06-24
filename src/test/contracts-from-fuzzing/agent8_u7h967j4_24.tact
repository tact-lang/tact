struct Step1 { s: String }
struct Step2 { st: Step1 }

contract NestedString {
    val: Step2;

    init() {
        self.val = Step2{ st: Step1{ s: "Hello" } };
    }
}
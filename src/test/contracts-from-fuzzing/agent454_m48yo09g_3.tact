struct DeepInner {
    flag: Bool;
    num: Int;
}

struct Outer {
    inn: DeepInner;
    text: String;
}

contract TestContract {
    innerField: Outer;
    init() {
        self.innerField = Outer{ inn: DeepInner{ flag: true, num: 7 }, text: "hi" };
    }
}
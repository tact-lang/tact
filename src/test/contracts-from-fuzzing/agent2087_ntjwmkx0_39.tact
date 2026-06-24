struct Layer1 {
    f1: Int;
}

struct Layer2 {
    inner: Layer1;
}

contract LayeredCapsCorrect {
    f: Layer2;

    init() {
        self.f = Layer2{inner: Layer1{f1:1}};
    }
}
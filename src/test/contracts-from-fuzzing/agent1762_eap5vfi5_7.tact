struct A {
    x: Int = 1;
    y: Bool = false;
}

contract DefaultVals {
    val: A;
    init() {
        self.val = A{}; // Use defaults only
    }
}
struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

contract MultiDifferentStructs {
    val1: Inner1;
    val2: Inner2;

    init() {
        self.val1 = Inner1{x: 3};
        self.val2 = Inner2{y: true};
    }
}
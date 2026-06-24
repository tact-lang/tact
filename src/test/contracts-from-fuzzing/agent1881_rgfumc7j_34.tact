struct Inner {
    i: Int;
}

struct Outer {
    inn: Inner;
    b: Bool;
}

contract OutIn {
    data: Outer;

    init() {
        self.data = Outer{ inn: Inner{i:5}, b: true };
    }
}
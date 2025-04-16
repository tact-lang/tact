struct Inner1 {
    a: Int = 1;
}

struct Inner2 {
    b: Int = 2;
}

struct Combined {
    inner1: Inner1;
    inner2: Inner2;
}

contract TestContract {
    combined: Combined;

    init() {
        self.combined = Combined{ inner1: Inner1{}, inner2: Inner2{} };
    }
}

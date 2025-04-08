struct Inner1 {
    a: String;
    b: Int;
}

struct Inner2 {
    x: Int?;
    y: Inner1;
}

contract TestContract {
    comb: Inner2;

    init() {
        self.comb = Inner2{
            x: null,
            y: Inner1{a:"a", b:5}
        };
    }
}
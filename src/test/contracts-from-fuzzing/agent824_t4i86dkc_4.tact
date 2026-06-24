struct Inner1 {
    val1: Int?;
    val2: String;
}

struct Inner2 {
    val3: Int;
    val4: Bool?;
}

struct Combined {
    i1: Inner1;
    i2: Inner2;
}

contract TestContract {
    data: Combined;

    init() {
        self.data = Combined{
            i1: Inner1{val1: null, val2: "hello"},
            i2: Inner2{val3: 5, val4: true},
        };
    }
}
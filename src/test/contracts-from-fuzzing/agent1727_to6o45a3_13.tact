struct Inner1 {
    a: Int = 1;
    b: Bool = false;
}

struct Inner2 {
    s: String = "";
    n: Int?;
}

struct Outer {
    in1: Inner1 = Inner1{};
    in2: Inner2 = Inner2{};
    flag: Bool = true;
}

contract DeepComplex {
    field: Outer = Outer{};
    
    receive() {
        self.field = Outer{
            in1: Inner1{a: 10, b: true},
            in2: Inner2{s: "go", n: 77},
            flag: false,
        };
    }
}
struct Inner1 {
    a: Int;
}

struct Middle1 {
    inner: Inner1;
}

struct Inner2 {
    b: Bool?;
}

struct Middle2 {
    inner: Inner2;
}

struct ComplexTop {
    part1: Middle1;
    part2: Middle2;
}

contract VeryNestedComplex {
    field: ComplexTop;

    init() {
        self.field = ComplexTop{
            part1: Middle1{inner: Inner1{a:1}},
            part2: Middle2{inner: Inner2{b:null}}
        };
    }
}
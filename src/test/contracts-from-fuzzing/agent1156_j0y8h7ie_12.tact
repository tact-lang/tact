struct Inner1 { val1: Int = 1; }
struct Inner2 { val2: Int = 2; }
struct Inner3 { val3: Int = 3; }
struct Inner4 { val4: Int = 4; }

struct Combined {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    i4: Inner4;
}

contract ManyNestedStructs {
    persist: Combined = Combined{ i1: Inner1{}, i2: Inner2{}, i3: Inner3{}, i4: Inner4{} };
    init() {}
}
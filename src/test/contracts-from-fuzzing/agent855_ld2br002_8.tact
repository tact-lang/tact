struct A { val1: Int }
struct B { val2: Int }
struct C { a: A; b: B; optInt: Int?; optStr: String? }

contract MixedOptionalsAndStructs {
    data: C;
    init() {
        self.data = C{
            a: A{val1:1},
            b: B{val2:2},
            optInt: null,
            optStr: "abc"
        };
    }
}
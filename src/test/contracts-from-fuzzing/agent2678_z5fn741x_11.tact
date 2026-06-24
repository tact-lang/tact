struct A1 { a: Int; }
struct A2 { b: Bool; }
struct A3 { c: String; }
struct Full {
    x: A1;
    y: A2;
    z: A3;
}

contract ManyNestedFields {
    data: Full;

    init() {
        self.data = Full{
            x: A1{a: 7},
            y: A2{b: false},
            z: A3{c: "end"}
        };
    }
}
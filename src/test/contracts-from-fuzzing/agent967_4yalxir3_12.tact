struct Simple1 { a: Int; }
struct Simple2 { b: String; }
struct Simple3 { c: Bool?; }
struct Combined {
    s1: Simple1;
    s2: Simple2;
    s3: Simple3;
}

contract ManyStructsCombined {
    data: Combined;

    init() {
        self.data = Combined{
            s1: Simple1{a: 5},
            s2: Simple2{b: "hi"},
            s3: Simple3{c: null}
        };
    }
}
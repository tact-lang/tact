struct Alpha { one: Int }
struct Beta { two: Int }
struct Gamma { three: Int }

struct Combined {
    a: Alpha;
    b: Beta;
    g: Gamma;
}

contract ManyNestedStructs {
    bundle: Combined;
    init() {
        self.bundle = Combined{
            a: Alpha{ one: 1 },
            b: Beta{ two: 2 },
            g: Gamma{ three: 3 }
        };
    }
}

struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }

struct Combined {
    i1: Inner1; 
    i2: Inner2; 
    i3: Inner3;
}

contract NestedStructs {
    value: Combined;

    init() {
        self.value = Combined{
            i1: Inner1{ a: 1 },
            i2: Inner2{ b: true },
            i3: Inner3{ c: "bye" }
        };
    }
}
struct Opt1 { a: Int? }
struct Opt2 { b: Bool? }
struct Opt3 { c: String? }

struct Combined {
    p: Opt1;
    q: Opt2;
    r: Opt3;
}

contract NestedOptionals {
    nested: Combined;

    init() {
        self.nested = Combined{
            p: Opt1{ a:null },
            q: Opt2{ b:true },
            r: Opt3{ c:null }
        };
    }
}
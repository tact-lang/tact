struct Inner1 { f: Int; }
struct Inner2 { f: Int; }

struct ContainsOptionals {
    a: Inner1?;
    b: Inner2?;
}

contract OptStructNested {
    nested: ContainsOptionals;

    init() {
        self.nested = ContainsOptionals{ a:null, b:null };
    }
}
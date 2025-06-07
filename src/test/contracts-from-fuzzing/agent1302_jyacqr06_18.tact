struct Opt1 { a: Int?; }
struct Opt2 { b: Opt1?; }
struct Opt3 { c: Opt2?; }

contract DeepOptionalChains {
    nested: Opt3?;

    init() {
        self.nested = Opt3 { c: Opt2 { b: Opt1 { a: null } } };
    }

    receive() {
        if (self.nested != null && self.nested!!.c != null && self.nested!!.c!!.b != null) {
            let a = self.nested!!.c!!.b!!.a;
        }
    }
}

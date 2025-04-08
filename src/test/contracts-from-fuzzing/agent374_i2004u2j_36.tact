// Large param nesting with optional
struct Inmost {
    foo: Int?;
}

struct VeryNested {
    inmost: Inmost?;
    flag: Bool;
}

contract ParamNestOpt(
    nested: VeryNested?
) {
    receive() {
        if (self.nested != null && self.nested!!.inmost != null && self.nested!!.inmost!!.foo != null) {
            let _ = self.nested!!.inmost!!.foo!!;
        }
    }
}
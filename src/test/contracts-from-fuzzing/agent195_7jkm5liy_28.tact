struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }

struct Inner3 { c: String; }

struct Mega {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}

contract Comb {
    mega: Mega;

    init() {
        self.mega = Mega{
            i1: Inner1{ a: 100 },
            i2: Inner2{ b: true },
            i3: Inner3{ c: "deep" }
        };
    }
}

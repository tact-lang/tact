struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }
struct Inner4 { d: Address; }
struct Inner5 { e: Slice; }

struct BigNest {
    s1: Inner1;
    s2: Inner2;
    s3: Inner3;
    s4: Inner4;
    s5: Inner5;
}

contract Test {
    val: BigNest;

    init() {
        self.val = BigNest{
            s1: Inner1{ a: 1 },
            s2: Inner2{ b: true },
            s3: Inner3{ c: "hi" },
            s4: Inner4{ d: myAddress() },
            s5: Inner5{ e: emptyCell().asSlice() },
        };
    }
}
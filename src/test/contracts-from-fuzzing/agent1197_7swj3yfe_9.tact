struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Inner3 { c: String; }
struct Middle {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
}
contract CrossStructs {
    val: Middle;

    init() {
        self.val = Middle{
            i1: Inner1{ a: 4 },
            i2: Inner2{ b: true },
            i3: Inner3{ c: "str" },
        };
    }
}
struct A { a: Int; b: Bool; c: String; }
struct B { inner: A; }
struct C { inner: B; }
contract CInContract {
    val: C;

    init() {
        self.val = C{
            inner: B{
                inner: A{
                    a: 7,
                    b: false,
                    c: "seven"
                }
            }
        };
    }
}
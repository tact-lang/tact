// Test contract with no explicit init() and single persistent struct with explicit defaults
struct Foo {
    a: Int = 1;
    b: Bool = true;
}

contract TestContract {
    st: Foo = Foo{};

    receive() {
        let _ = self.st.a + (self.st.b ? 1 : 0);
    }
}
struct Nested { a: Int; b: Int?; }
struct Outer { inner: Nested; s: String; }

contract TestComplex {
    fun test() {
        // Create a nested struct with an optional field
        let n: Nested = Nested{ a: 100, b: null };
        let o: Outer = Outer{ inner: n, s: "hello" };
        let cell = o.toCell();
        let o2: Outer = Outer.fromCell(cell);
        // Verify that the deserialized fields hold correct values
        dump(o2.inner.a == 100);
        dump(o2.s == "hello");

        // Now update with a non-null optional field
        let n2: Nested = Nested{ a: 50, b: 150 };
        dump(n2.b!! == 150);
    }

    receive() {
        self.test();
    }
}

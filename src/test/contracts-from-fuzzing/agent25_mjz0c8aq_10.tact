struct Complex { maybe: Int?; nested: Nested?; }
struct Nested { value: Bool; }

contract TestComplexNested {
    fun test() {
        // Create a Complex struct with both fields set to null
        let c: Complex = Complex{ maybe: null, nested: null };
        dump(c.maybe == null);
        dump(c.nested == null);

        // Now create with a non-null nested struct
        let n: Nested = Nested{ value: true };
        let c2: Complex = Complex{ maybe: 999, nested: n };
        dump(c2.maybe == 999);
        dump(c2.nested!!.value); // use non-null assertion operator as !!
    }

    receive() {
        self.test();
    }
}

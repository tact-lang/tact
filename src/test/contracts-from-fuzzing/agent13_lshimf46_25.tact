struct S { inner: Int }

contract TestOptionalFieldAccess2 {
    receive() {
        let s: S? = null;
        // Using non-null assertion to access field 'inner'
        let v: Int = s!!.inner;
        dump(v);
    }
}

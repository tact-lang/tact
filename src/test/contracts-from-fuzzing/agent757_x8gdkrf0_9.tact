struct Inner { a: Int; }
struct Outer { inner: Inner; }

contract TestContract {
    persist: Outer? = null;

    init() {
        self.persist = Outer{ inner: Inner{a:10} };
    }
}
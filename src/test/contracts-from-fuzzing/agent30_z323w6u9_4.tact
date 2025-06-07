struct L5 { value: Int; }
struct L4 { inner: L5; }
struct L3 { inner: L4; }
struct L2 { inner: L3; }
struct L1 { inner: L2; }

contract TestDeepChain {
    receive() {
        let a: L1 = L1{ inner: L2{ inner: L3{ inner: L4{ inner: L5{ value: 100 } } } } };
        let y = a.inner.inner.inner.inner.value;
    }
}

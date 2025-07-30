struct Inner { x: Int; }
struct Middle { inner: Inner; }
struct Outer { mid: Middle; }

contract TestContract {
    val: Outer = Outer{ mid: Middle{ inner: Inner{ x: 42 } } };
    receive() { let _ = self.val; }
}
struct Leaf { v: Int }
struct Inner { child: Leaf? } 
struct Outer { inner: Inner? }

contract NullNestedOptionals {
    state: Outer = Outer{ inner: null };

    init() {
        self.state = Outer{ inner: Inner{ child: null } };
    }
}
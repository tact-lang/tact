struct Demo1 { a: Int }
struct Demo2 { b: Int }
struct Demo3 { d1: Demo1; d2: Demo2 }

contract MultiNested {
    inner: Demo3;

    init() {
        self.inner = Demo3{ d1: Demo1{a:7}, d2: Demo2{b:9} };
    }
}

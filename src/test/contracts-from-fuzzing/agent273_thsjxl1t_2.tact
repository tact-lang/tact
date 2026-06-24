struct DeepNest3 { a: Int; }
struct DeepNest2 { inner3: DeepNest3; }
struct DeepNest1 { inner2: DeepNest2; }

contract Test2 {
    state: DeepNest1;

    init() {
        self.state = DeepNest1{
            inner2: DeepNest2{
                inner3: DeepNest3{ a: 42 }
            }
        };
    }
}
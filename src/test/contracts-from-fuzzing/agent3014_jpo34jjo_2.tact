struct DeepNest1 {
  a: Int;
}

struct DeepNest2 {
  b: DeepNest1;
}

struct DeepNest3 {
  c: DeepNest2;
}

contract TestContract {
    data: DeepNest3;

    init() {
        self.data = DeepNest3{
            c: DeepNest2{
                b: DeepNest1{
                    a: 123
                }
            }
        };
    }
}
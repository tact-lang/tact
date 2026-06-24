struct DeepNest1 {
    a: DeepNest2;
}
struct DeepNest2 {
    b: DeepNest3;
}
struct DeepNest3 {
    c: DeepNest4;
}
struct DeepNest4 {
    d: Int;
}

contract TestContract {
    val: DeepNest1;

    init() {
        self.val = DeepNest1{
            a: DeepNest2{
                b: DeepNest3{
                    c: DeepNest4{ d: 42 }
                }
            }
        };
    }
}
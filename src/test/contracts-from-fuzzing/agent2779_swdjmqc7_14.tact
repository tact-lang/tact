struct DeepNest4 {
    val: Int?;
}
struct DeepNest3 {
    sub4: DeepNest4;
}
struct DeepNest2 {
    sub3: DeepNest3;
}
struct DeepNest1 {
    sub2: DeepNest2;
}
contract VeryDeepNested {
    top: DeepNest1;
    init() {
        self.top = DeepNest1{
            sub2: DeepNest2{
                sub3: DeepNest3{
                    sub4: DeepNest4{val: null}
                }
            }
        };
    }
}
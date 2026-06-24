struct DeepDeep {
    lvl1: DeepDeep1;
}
struct DeepDeep1 {
    lvl2: DeepDeep2;
}
struct DeepDeep2 {
    lvl3: DeepDeep3;
}
struct DeepDeep3 {
    lvl4: DeepDeep4;
}
struct DeepDeep4 {
    leaf: Int;
}
contract Test {
    data: DeepDeep;
    init() {
        self.data = DeepDeep{
            lvl1: DeepDeep1{
                lvl2: DeepDeep2{
                    lvl3: DeepDeep3{
                        lvl4: DeepDeep4{
                            leaf: 5
                        }
                    }
                }
            }
        };
    }
}
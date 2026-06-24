struct DeepNest2 {
    nest1: Inner1;
}
struct Inner1 {
    nest2: Inner2;
}
struct Inner2 {
    nest3: Inner3;
}
struct Inner3 {
    field: Int;
}
contract VeryDeepNested {
    d: DeepNest2;

    init() {
        self.d = DeepNest2{
            nest1: Inner1{
                nest2: Inner2{
                    nest3: Inner3{
                        field: 42
                    }
                }
            }
        };
    }
}

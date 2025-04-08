struct DeeplyNestedOptionals {
    lvl1: Inner1?;
}

struct Inner1 {
    lvl2: Inner2?;
}

struct Inner2 {
    val: Int?;
}

contract DeepNestedOpts {
    s: DeeplyNestedOptionals;

    init() {
        self.s = DeeplyNestedOptionals{
            lvl1: Inner1{
                lvl2: Inner2{
                    val:null
                }
            }
        };
    }
}
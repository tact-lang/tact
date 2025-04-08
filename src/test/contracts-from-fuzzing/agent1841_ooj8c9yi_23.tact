struct OptionalDeep {
    lv1: Inner1?;
}

struct Inner1 {
    lv2: Inner2?;
}

struct Inner2 {
    val: Int?;
}

contract DeepNullable {
    root: OptionalDeep;

    init() {
        self.root = OptionalDeep{
            lv1: Inner1{
                lv2: Inner2{val:null}
            }
        };
    }
}

struct Deep1 {
    num: Int;
}
struct Deep2 {
    inner: Deep1;
    b: Bool;
}
struct Deep3 {
    dep: Deep2;
    str: String;
}

contract DeepDeep {
    storage: Deep3;

    init() {
        self.storage = Deep3{
            dep: Deep2{inner: Deep1{num:7}, b:true},
            str: "deep"
        };
    }
}
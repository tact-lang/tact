struct DeepNest {
    i: Int;
    flag: Bool;
    msg: String;
}

struct Outer {
    num: Int;
    inner: DeepNest;
    optional: String?;
}

contract TestStorage {
    storage: Outer;

    init() {
        self.storage = Outer{
            num: 10,
            inner: DeepNest{i:5, flag:true, msg:"hello"},
            optional: null
        };
    }
}
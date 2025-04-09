struct DeepCombo {
    a: Int;
    inner: InnerCombo;
}

struct InnerCombo {
    b: Int?;
    flag: Bool;
    s: String;
}

contract NestedValues {
    data: DeepCombo;
    init() {
        self.data = DeepCombo{
            a:1,
            inner: InnerCombo{b:null,flag:true,s:"S"}
        };
    }
}
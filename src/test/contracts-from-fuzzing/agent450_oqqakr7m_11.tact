struct Nested {
    val: Int?;
    flag: Bool?;
}

struct Holder {
    a: Int;
    opt: String?;
    inner: Nested;
}

contract DeepCombo {
    data: Holder;
    init() {
        self.data = Holder{a:5,opt:null,inner:Nested{val:null,flag:true}};
    }
}
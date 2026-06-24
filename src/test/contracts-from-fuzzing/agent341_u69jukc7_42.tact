struct OptInStruct {
    inn: Inner?;
}

struct Inner {
    x: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    val: OptInStruct;

    init() {
        self.val = OptInStruct{
            inn: Inner{ x:null, b:null, s:null }
        };
    }
}
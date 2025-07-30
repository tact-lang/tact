struct OptStr {
    val: String?;
}

struct WrapOptStr {
    inner: OptStr?;
}

contract DeepOptStr {
    data: WrapOptStr;

    init() {
        self.data = WrapOptStr{inner:null};
    }
}

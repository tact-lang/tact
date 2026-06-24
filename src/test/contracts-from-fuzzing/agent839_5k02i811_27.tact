struct Bundle {
    a: Int;
    b: String?;
    c: Bool;
    d: Address;
}

contract BundleTest {
    val: Bundle;
    opt: Bundle?;
    init() {
        self.val = Bundle{a:1,b:null,c:true,d:myAddress()};
        self.opt = null;
    }
}
struct LeafOpt { x: Int?; y: Bool?; }
struct WrapOpt { leaf: LeafOpt?; }

contract ComboPersistent {
    nestedOpt: WrapOpt?;
    count: Int;
    flag: Bool;
    text: String;
    addr: Address;
    
    init() {
        self.nestedOpt = null;
        self.count = 123;
        self.flag = true;
        self.text = "fuzz";
        self.addr = myAddress();
    }
}
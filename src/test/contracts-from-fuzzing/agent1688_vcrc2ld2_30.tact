struct MultiType {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    j: Int;
    flag: Bool;
    text: String;
    who: Address;
}

contract TestContract {
    data: MultiType;
    init() {
        self.data = MultiType{
            i:1, b:true, s:"a", addr:myAddress(),
            j:2, flag:false, text:"b", who:myAddress()
        };
    }
}
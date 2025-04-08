struct OutOfOrder {
    int1: Int;
    str: String;
    int2: Int;
    flag: Bool;
    int3: Int;
    addr: Address;
}

contract OrderMixFields {
    data: OutOfOrder;

    init() {
        self.data = OutOfOrder{
            int1:1,str:"hi",int2:2,flag:true,int3:3,addr:myAddress()
        };
    }
}

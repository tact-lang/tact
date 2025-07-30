struct Data {
    x: Int;
    y: Int;
    z: Int;
    s: String;
    f: Bool;
    addr: Address;
}

contract TestContract {
    data1: Data;
    data2: Data;
    data3: Data;

    init() {
        self.data1 = Data{
            x: 1, y:2, z:3, s:"a", f:true, addr: myAddress()
        };
        self.data2 = Data{
            x: 4, y:5, z:6, s:"b", f:false, addr: myAddress()
        };
        self.data3 = Data{
            x: 7, y:8, z:9, s:"c", f:true, addr: myAddress()
        };
    }
}

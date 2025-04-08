struct Combo {
    n: Int;
    s: String;
    adr: Address;
    bl: Bool;
}

contract MixedFields {
    field: Combo = Combo{n:42,s:"test",adr:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),bl:true};
    init() {
        self.field = Combo{n:5,s:"zzz",adr:address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),bl:false};
    }
    receive() {}
}
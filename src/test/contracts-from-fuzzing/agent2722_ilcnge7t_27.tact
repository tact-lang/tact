struct Reversed {
    s: String;
    b: Bool;
    i: Int;
    optS: String?;
    optB: Bool?;
    optI: Int?;
}

contract ReverseOrder {
    data: Reversed;

    init() {
        self.data = Reversed{
            s:"s", b:true, i:1,
            optS:null, optB:null, optI:null
        };
    }
}
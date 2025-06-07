struct AddressHolder {
    addr1: Address;
    addr2: Address?;
    addr3: Address?;
}

struct BoolNest {
    b1: Bool;
    b2: Bool?;
    b3: Bool?;
}

contract MixNestedOptional {
    ah: AddressHolder?;
    bn: BoolNest?;

    init() {
        self.ah = null;
        self.bn = null;
    }
}

contract Use {
    receive() {
        let dummy: MixNestedOptional? = null;
    }
}
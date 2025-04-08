struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
}

contract MixedTypesStorage {
    val: MixedTypes;

    init() {
        self.val = MixedTypes{ i:1, b:true, s:"x", c:emptyCell(), a:myAddress() };
    }
}
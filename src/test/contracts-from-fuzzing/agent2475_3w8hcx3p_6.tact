struct IntsAndBools {
    i1: Int;
    b1: Bool;
    i2: Int;
    b2: Bool;
    i3: Int;
    b3: Bool;
}

contract MixedTypesContract {
    data: IntsAndBools;
    init() {
        self.data = IntsAndBools{
            i1:1, b1:true, i2:2, b2:false, i3:3, b3:true
        };
    }
}
struct MixSimple {
    i: Int;
    b: Bool;
    s: String;
}

struct MixDefault {
    i: Int = 1;
    b: Bool = true;
    s: String = "ok";
}

contract MixedStructs {
    s1: MixSimple;
    s2: MixDefault;

    init() {
        self.s1 = MixSimple{i:2,b:false,s:"no"};
        self.s2 = MixDefault{};
    }
}

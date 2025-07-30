struct DeepStruct {
    x: Int?;
    y: Bool?;
}

message(42) DeepMsg { z: String? }

struct Combo {
    s: DeepStruct?;
    m: DeepMsg?;
}

contract OptionalNestedCombos {
    data: Combo = Combo{ s:null, m:null };

    init() {
        self.data = Combo{
            s:DeepStruct{ x:7, y:true },
            m:DeepMsg{ z:"yo" }
        };
    }
}
// contract with multiple nested structs with wide optional and primitive field combos
struct Alpha {
    x: Int;
    y: Bool?;
    z: Address;
}

struct Beta {
    s: String?;
    inner: Alpha;
    flag: Bool;
    opt: Int?;
}

struct Gamma {
    one: Beta;
    two: Alpha?;
    str: String;
}

contract ComplexStructMix {
    g: Gamma;

    init() {
        self.g = Gamma{
            one: Beta{
                s: null,
                inner: Alpha{ x: 5, y: null, z: myAddress() },
                flag: true,
                opt: null
            },
            two: null,
            str: "ok"
        };
    }
}
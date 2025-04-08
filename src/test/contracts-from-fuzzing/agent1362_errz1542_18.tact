struct OptionCombi {
    x: Int?;
    y: OptionNested?;
}

struct OptionNested {
    z: Bool?;
}

contract OptCombiContract {
    field: OptionCombi = OptionCombi{ x:null, y:null };
}
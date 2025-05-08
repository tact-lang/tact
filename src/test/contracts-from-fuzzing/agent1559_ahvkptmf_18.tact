struct Combo {
    x: Int;
    y: Int?;
    z: Bool;
    q: Address?;
    name: String;
}

contract ComboStructTest {
    combo: Combo;
    init() {
        self.combo = Combo {
            x: 5, y: null, z:true, q:null, name:"combo"
        };
    }
}
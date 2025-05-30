struct CombLevel2 {
    a: Int;
    b: Bool?;
}
struct CombLevel1 {
    x: CombLevel2;
    y: Int?;
    z: Bool;
}
contract CrossLevelPerms {
    state: CombLevel1;
    init() {
        self.state = CombLevel1{
            x: CombLevel2{ a: 5, b: null },
            y: 10,
            z: true
        };
    }
}
struct Level3 { d: Int; opt: String?; }
struct Level2 { c: Bool; inner: Level3; }
struct Level1 { b: Int; inner: Level2; flag: Bool; }

contract MidOptional {
    val: Level1;
    init() {
        self.val = Level1{
            b: 55,
            inner: Level2{ c:true, inner: Level3{ d:42, opt:null } },
            flag: false
        };
    }
}
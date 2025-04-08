struct Level3 { p: Int; q: Bool; }
struct Level2 { inner: Level3; x: Int?; }
struct Level1 { a: Int; opt: Level2?; }

contract DeepOptionalTest {
    data: Level1;

    init() {
        self.data = Level1{
            a:5,
            opt: Level2{ inner: Level3{ p:1, q:true }, x:null }
        };
    }
}

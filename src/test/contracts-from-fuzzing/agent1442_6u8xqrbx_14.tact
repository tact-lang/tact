// test comma after last element in struct fields
struct Level3 { i: Int; }
struct Level2 { next: Level3; b: Bool; }
struct Level1 { next: Level2; s: String; }

contract TestContract {
    data: Level1;
    init() {
        self.data = Level1{next: Level2{next: Level3{i:123},b:true}, s:"x"};
    }
}
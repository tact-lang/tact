struct Level3 {
  val: Int;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  nested: Level2;
}

contract TestContract {
    hierarchy: Level1;

    init() {
        self.hierarchy = Level1{
            nested: Level2{
                nested: Level3{
                    val: 123
                }
            }
        };
    }
}
struct Level2 {
    z: Int? = null;
}

struct Level1 {
    y: Level2? = null;
}

contract TestNestedOptionals {
    data: Level1? = null;

    init() {
        self.data = Level1{
            y: Level2{
                z: 77
            }
        };
    }
}
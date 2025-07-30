struct Level2 {
    info: String?;
}

struct Level1 {
    data: Level2?;
}

struct Container {
    item: Level1;
}

contract DeepOptionals {
    val: Container;

    init() {
        self.val = Container{
            item: Level1{
                data: null
            }
        };
    }
}
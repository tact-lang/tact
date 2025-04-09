struct DeepDefaults1 {
    x: Int = 1;
    y: DeepDefaults2;
}

struct DeepDefaults2 {
    z: Int = 2;
    w: DeepDefaults3;
}

struct DeepDefaults3 {
    t: Int = 3;
}

contract TestContract {
    data: DeepDefaults1;

    init() {
        self.data = DeepDefaults1{
            y: DeepDefaults2{
                w: DeepDefaults3{
                }
            }
        };
    }
}
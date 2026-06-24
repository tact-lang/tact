struct DeepOptional {
    wrap: Middle?;
}

struct Middle {
    inner: Bottom;
}

struct Bottom {
    val: Int;
}

contract DeepOptContract {
    data: DeepOptional;
    init() {
        self.data = DeepOptional{ wrap: null };
    }
}
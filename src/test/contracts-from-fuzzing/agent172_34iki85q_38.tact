struct DeepOpt {
    num: Int?;
}

struct Middle {
    deep: DeepOpt?;
}

contract UninitDeepOptional {
    val: Middle;

    init() {
        self.val = Middle{
            deep: null,  // explicit
        };
    }
}
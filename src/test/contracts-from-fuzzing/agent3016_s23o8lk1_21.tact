struct DefaultOptional {
    val: Int?;
}

contract TestContract {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{
            val: null
        };
    }
}
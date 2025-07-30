struct Inner {
    message: String = "مرحبا";
    num: Int = 1;
}

contract TestContract {
    data: Inner = Inner{};

    init() {
        self.data = Inner{message:"γειά", num:2};
    }
}
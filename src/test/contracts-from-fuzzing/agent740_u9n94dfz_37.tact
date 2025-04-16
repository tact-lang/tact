struct WrapOpt {
    inner: OptI?;
}

struct OptI {
    val: Int?;
}

contract WrapOptContract {
    data: WrapOpt;
    init() {
        self.data = WrapOpt{};
    }
}
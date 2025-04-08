// using optionals and default values
struct DefaultsOpt {
    x: Int = 3;
    y: Bool?;
    z: String = "ok";
}

contract DefaultsOptional {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};
    }
}
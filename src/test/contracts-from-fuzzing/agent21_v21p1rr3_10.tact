struct OptionalNoDefault {
    a: Int?;
}

contract TestOptionalDefault {
    receive() {
        let x: OptionalNoDefault = OptionalNoDefault{};
        return;
    }
}

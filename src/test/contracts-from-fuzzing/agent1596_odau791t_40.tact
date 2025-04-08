struct DefaultsNestedOpt {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

contract DefaultsNestedOptContract {
    s: DefaultsNestedOpt = DefaultsNestedOpt{};
    receive() {
        let _ = self.s.y;
    }
}
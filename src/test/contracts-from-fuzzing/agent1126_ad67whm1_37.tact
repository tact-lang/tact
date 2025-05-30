struct OptWithDefault {
    val: Int? = null;
}

contract TestOptDefaultNested {
    data: OptWithDefault;
    init() {
        self.data = OptWithDefault{}; // use default val inside struct
    }
}
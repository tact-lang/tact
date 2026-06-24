struct OptDefault {
    num: Int? = null;
    str: String = "x";
}

contract OptDefField {
    val: OptDefault;

    init() {
        self.val = OptDefault{ num: null, str: "y" };
    }
}
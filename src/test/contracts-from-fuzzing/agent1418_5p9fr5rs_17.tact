struct BigDefault {
    x: Int = 100;
    y: Bool = true;
    s: String = "big";
}

contract StructDefaultOverride {
    ff: BigDefault;

    init() {
        self.ff = BigDefault{ x: 200, y: false, s: "larger" };
    }
}
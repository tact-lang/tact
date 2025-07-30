struct SDefault {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultsInStructs {
    data: SDefault;

    init() {
        self.data = SDefault{}; // rely fully on defaults
    }
}
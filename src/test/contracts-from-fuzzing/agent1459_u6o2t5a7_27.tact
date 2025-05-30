struct SDefault {
    a: Int?;
}

contract OptWithNoInit {
    data: SDefault;

    init() {
        self.data = SDefault{}; // relies on optional default null
    }
}

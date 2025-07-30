contract TestContract {
    name: String?;
    count: Int = 0;

    init() {
        self.name = "Tester";
        self.count = 1;
    }
}
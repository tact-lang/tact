struct SStrOpt {
    s1: String?;
    s2: String?;
}

contract OptStrStorage {
    data: SStrOpt;

    init() {
        self.data = SStrOpt{};
    }

    receive() {
        let _ = self.data;
    }
}
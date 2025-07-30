struct SingleOptional {
    flag: Bool?;
}

contract TestStorage {
    data: SingleOptional;

    init() {
        self.data = SingleOptional{ flag: null };
    }
}
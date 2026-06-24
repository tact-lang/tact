struct HasBoolOpt {
    flag: Bool?;
}

contract BoolOptStorage {
    data: HasBoolOpt;

    init() {
        self.data = HasBoolOpt { flag: true };
    }
}

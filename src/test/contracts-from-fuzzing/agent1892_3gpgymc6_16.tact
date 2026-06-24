struct HasStringOptional {
    s: String?;
}

contract StringOptContract {
    val: HasStringOptional;

    init() {
        self.val = HasStringOptional{ s: null };
    }
}
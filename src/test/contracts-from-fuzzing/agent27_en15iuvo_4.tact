struct EmptyOpt {
    opt: Int?;
}

contract DefaultNull {
    item: EmptyOpt;

    init() {
        self.item = EmptyOpt{}; // implicit null
    }
}
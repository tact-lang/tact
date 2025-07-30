struct Rolled {
    i:Int;
}

contract RedeclareDefaults {
    data: Rolled = Rolled{i:5};
    init() {
        self.data = Rolled{i:10};
    }
}
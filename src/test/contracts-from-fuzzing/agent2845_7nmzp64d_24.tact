struct Inside {
    x: Int;
}

contract StorageNullInit {
    data: Inside?;

    init() {
        self.data = null;
    }
}
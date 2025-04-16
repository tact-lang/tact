struct OneFieldOptional {
    val: Int?;
}

contract OptionalFieldStorage {
    data: OneFieldOptional;
    init() {
        self.data = OneFieldOptional{val: null};
    }
}
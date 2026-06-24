struct Nested {
    num: Int;
    flag: Bool;
}

contract SingleField {
    data: Nested; 
    init() {
        self.data = Nested{
            num: 42,
            flag: true,
        };
    }
}
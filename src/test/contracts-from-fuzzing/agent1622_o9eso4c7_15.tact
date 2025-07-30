struct Details {
    age: Int;
    name: String;
}

contract InitNullAssign {
    data: Details?;

    init() {
        self.data = null;
    }
}
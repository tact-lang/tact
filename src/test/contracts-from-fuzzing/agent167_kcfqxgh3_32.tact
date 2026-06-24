struct Data {
    x: Int;
}

contract AssignDirect {
    d: Data;

    init() {
        self.d = Data{x:5};
        self.d.x = 10;  // mutate after assign
    }
}
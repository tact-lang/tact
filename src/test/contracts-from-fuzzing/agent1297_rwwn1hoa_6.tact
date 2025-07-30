struct Data {
    val: Int;
    flag: Bool;
}

contract AssignInInit {
    data: Data;
    init() {
        self.data = Data{ val: 100, flag: true };
    }
}
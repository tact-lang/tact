struct Data {
    val: Int? = null;
    num: Int;
}

contract TestContract {
    data: Data;

    init() {
        self.data = Data{ val: null, num: 42 };
    }
}
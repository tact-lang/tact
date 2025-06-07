struct MyData {
    id: Int;
    txt: String;
}

contract TestContract {
    rec: MyData?;

    init() {
        self.rec = null;
    }
}
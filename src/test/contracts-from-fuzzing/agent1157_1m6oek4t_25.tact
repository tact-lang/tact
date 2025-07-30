struct MyNested {
    x: Int;
    y: Bool;
    s: String;
}

contract ParamStructTest(
    data: MyNested
) {
    receive() {
        let tmp = self.data;
    }
}
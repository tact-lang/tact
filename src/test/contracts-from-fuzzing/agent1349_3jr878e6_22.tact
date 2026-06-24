struct WithStringAndBool {
    s: String;
    b: Bool;
    opt: Int?;
}

contract ComboTest {
    data: WithStringAndBool = WithStringAndBool{ s:"x", b:true, opt:null };

    receive() {
        self.data = self.data;
    }
}
contract StringTest {
    receive() {
        let s: String = "\n New line \n and \"quotes\" here.";
        let result: String = s.asSlice().asString();
    }
}
struct MyHolder { text: String }

contract TestContract {
    receive() {
        let h: MyHolder = MyHolder { text: "struct string test" };
        let s: String = h.text;
    }
}

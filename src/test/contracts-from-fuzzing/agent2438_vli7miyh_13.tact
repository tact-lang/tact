struct CustomStr {
    text: String;
}

contract ContractWithStr {
    s: CustomStr;

    init() {
        self.s = CustomStr{ text: "hello" };
    }
}

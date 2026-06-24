struct BigStringStruct {
    longString: String;
}

contract TestContract {
    s: BigStringStruct;

    init() {
        self.s = BigStringStruct{
            longString: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
        };
    }
}
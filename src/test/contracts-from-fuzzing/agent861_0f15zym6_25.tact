struct NumAndStr {
    x: Int = 1;
    s: String = "default";
}

contract MixedDefaultStruct {
    data: NumAndStr;

    init() {
        self.data = NumAndStr{};
    }

    receive() {
        let _ = self.data;
    }
}
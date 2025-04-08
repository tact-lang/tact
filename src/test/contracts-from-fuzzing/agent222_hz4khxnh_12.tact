struct ContainsBoolStringInt {
    b: Bool = false;
    s: String = "start";
    i: Int = 123;
}

contract MixedStruct {
    val: ContainsBoolStringInt = ContainsBoolStringInt{};

    receive() {
        self.val = ContainsBoolStringInt{b: true, s: "done", i: 456};
    }
}
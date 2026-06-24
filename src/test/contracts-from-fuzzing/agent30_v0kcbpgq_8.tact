/// Test Case: Valid Message usage with optional field
message ValidMsg {
    field1: Int as uint8;
    field2: String?; // optional string, allowed
}

contract TestMessageValid() {
    fun run() {
        // Create a message cell from ValidMsg
        let mcell: Cell = ValidMsg{ field1: 42, field2: "optional text" }.toCell();
        dump(mcell);
    }
    receive() {
        self.run();
    }
}

// Struct with strings of various default and nullable configuration
struct StringsPack {
    s1: String = "";
    s2: String?;
    s3: String = "default";
    s4: String?;
    s5: String = "hello";
}

contract TestContract {
    val: StringsPack;

    init() {
        self.val = StringsPack{
            s1: "first",
            s2: null,
            s3: "second",
            s4: null,
            s5: "third"
        };
    }

    receive() {
        self.val = self.val;
    }
}
struct BigStringStruct {
    s1: String = "This is a very big default string with many characters 1234567890 abcdefghijklmnopqrstuvwxyz";
    s2: String;
}

contract TestContract {
    value: BigStringStruct;

    init() {
        self.value = BigStringStruct{
            s1: "Another quite large string just for test purposes xyz 0987654321 abcdefghijklmnopqrstuvwxyz",
            s2: "Second big string!!!"
        };
    }
}
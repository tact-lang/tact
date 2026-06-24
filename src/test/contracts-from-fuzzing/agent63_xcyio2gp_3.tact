struct WithOptional {
    s: String;
    val: Int?;
    flag: Bool?;
}

contract OptStructField {
    data: WithOptional;

    init() {
        self.data = WithOptional{
            s: "hello",
            val: null,
            flag: true
        };
    }
}
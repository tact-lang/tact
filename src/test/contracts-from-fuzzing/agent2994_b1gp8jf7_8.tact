struct StringHolder {
    s: String;
}

struct OptionalStruct {
    holder: StringHolder?;
}

contract OptStructTest {
    d: OptionalStruct;

    init() {
        self.d = OptionalStruct{
            holder: StringHolder{
                s: "hello"
            }
        };
    }
}
struct OptStruct {
    num: Int?;
    flag: Bool?;
    txt: String?;
}

contract OptionalFieldsTest {
    os: OptStruct = OptStruct{ num: null, flag: true, txt: null };

    receive() {
        let _ = self.os.flag;
    }
}
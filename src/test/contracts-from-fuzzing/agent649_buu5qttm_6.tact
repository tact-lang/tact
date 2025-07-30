struct HasOptional {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract OptTest {
    data: HasOptional = HasOptional{
        optInt: null,
        optBool: null,
        optString: null
    };
    receive() {
        let _ = self.data.optInt;
    }
}
struct HasEmptyString {
    s: String;
}

contract EmptyStringTest {
    data: HasEmptyString;

    init() {
        self.data = HasEmptyString{
            s: ""
        };
    }
}
struct StringHolder {
    s: String;
    s2: String;
    s3: String;
}

contract StringsTest {
    str: StringHolder;

    init() {
        self.str = StringHolder{
            s:"hello",
            s2:"world",
            s3:"!"
        };
    }
}
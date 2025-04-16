struct NumString {
    num: Int;
    str: String;
}

contract MixOptNested {
    val: NumString?;

    init() {
        self.val = NumString{
            num: 99,
            str: "ninety-nine"
        };
    }
}